`timescale 1 ps / 1 ps

module displayTb;

    // Parameters
    parameter CLK_PERIOD = 20; // Clock period in ns (50 MHz)
    parameter DISPLAY_WIDTH = 640;
    parameter DISPLAY_HEIGHT = 480;
    parameter CHECKER_SIZE = 20; 
    
    // Testbench Signals
    logic clk;
    logic reset;
    logic [31:0] writedata;
    logic write;
    logic chipselect;
    logic [14:0] address;
    
    // VGA outputs
    logic [7:0] VGA_R, VGA_G, VGA_B;
    logic VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_n, VGA_SYNC_n;
    
    // Instantiate the DUT
    vga_ball dut (
        .clk(clk),
        .reset(reset),
        .writedata(writedata),
        .write(write),
        .chipselect(chipselect),
        .address(address),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_CLK(VGA_CLK),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_BLANK_n(VGA_BLANK_n),
        .VGA_SYNC_n(VGA_SYNC_n)
    );
    
    // Clock Generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end
    
    // Calculate checkerboard pattern value for a given position
    function logic get_expected_pixel(int x, int y);
        return ((x / CHECKER_SIZE) % 2 == (y / CHECKER_SIZE) % 2) ? 1'b1 : 1'b0;
    endfunction
    
    // Main test sequence
    initial begin
        // Declare variables that will be used in the loops
        logic [31:0] pattern_word;
        int addr;
        int pass_count;
        int fail_count;
        logic verbose;
        logic expected;
        logic actual;
        int x, y, bit_idx, i;
        
        // Initialize signals
        reset = 1;
        write = 0;
        chipselect = 0;
        address = 0;
        writedata = 0;
        
        // Apply reset
        #(CLK_PERIOD * 5);
        reset = 0;
        $display("Time=%t: Deasserting reset", $time);
        
        // Wait for reset to propagate
        #(CLK_PERIOD * 10);
        
        // Test: Write checkerboard pattern to framebuffer
        $display("Time=%t: Starting to write checkerboard pattern to framebuffer", $time);
        
        // Loop through pixel rows in blocks of 32 pixels (one word)
        for (y = 0; y < DISPLAY_HEIGHT; y++) begin
            // Loop through pixel columns in blocks of 32 pixels
            for (x = 0; y < DISPLAY_WIDTH; x += 32) begin
                // Construct a 32-bit word with the appropriate checkerboard pattern
                pattern_word = 0;
                
                for (bit_idx = 0; bit_idx < 32; bit_idx++) begin
                    if (x + bit_idx < DISPLAY_WIDTH) begin
                        // Set the bit according to checkerboard pattern
                        if (get_expected_pixel(x + bit_idx, y))
                            pattern_word[bit_idx] = 1'b1;
                    end
                end
                
                // Calculate the address for this 32-bit word
                addr = (y * (DISPLAY_WIDTH / 32)) + (x / 32);
                
                // Write the word to the framebuffer
                @(posedge clk);
                chipselect = 1;
                write = 1;
                address = addr[14:0];
                writedata = pattern_word;
                
                // Print progress for certain positions
                if (y % 40 == 0 && x == 0) begin
                    $display("Time=%t: Writing row %0d, pattern word = %h", $time, y, pattern_word);
                end
                
                @(posedge clk);
            end
        end
        
        // Release control signals
        chipselect = 0;
        write = 0;
        
        $display("Time=%t: Finished writing checkerboard pattern", $time);
        
        // Wait a moment for the pattern to stabilize in the display
        #(CLK_PERIOD * 100);
        
        // Start comprehensive verification
        $display("Time=%t: Starting comprehensive verification of checkerboard pattern", $time);

        // Initialize tracking variables
        pass_count = 0;
        fail_count = 0;

        // Sample a subset of pixels for verification (every 20th pixel)
        // This reduces simulation time while still providing good coverage
        for (y = 0; y < DISPLAY_HEIGHT; y += 5) begin
            for (x = 0; x < DISPLAY_WIDTH; x += 5) begin
                // Use existing verification mechanism but with less logging
                expected = get_expected_pixel(x, y);
                
                // Force DUT to display this point
                force dut.hcount = {x[9:0], 1'b0}; // Properly formatting 11-bit hcount
                force dut.vcount = y;
                
                // Allow time to propagate
                #(CLK_PERIOD * 1);
                
                // Check result (VGA_B is what's being checked based on display.sv)
                actual = (VGA_B == 8'hFF) ? 1'b1 : 1'b0;
                if (actual == expected) begin
                    pass_count++;
                    // Only print occasionally for progress indication
                    if (x % 100 == 0 && y % 100 == 0) 
                        $display("PASS: Pixel (%0d,%0d)", x, y);
                end else begin
                    fail_count++;
                    // Always print failures
                    $display("FAIL: Pixel (%0d,%0d) - expected %0b, got %0b", 
                            x, y, expected, actual);
                            
                    // Detailed debug for failures - print the pattern word for this region
                    addr = (y * (DISPLAY_WIDTH / 32)) + (x / 32);
                    bit_idx = x % 32;
                    $display("  Debug: addr=0x%h, bit_pos=%0d, pattern_word used=%h", 
                            addr, bit_idx, pattern_word);
                end
                
                // Release the forced values
                release dut.hcount;
                release dut.vcount;
            end
            
            // Print progress every few rows
            if (y % 50 == 0) begin
                $display("Verified up to row %0d, %0d/%0d pixels passed (%0.2f%%)", 
                       y, pass_count, pass_count + fail_count,
                       (pass_count * 100.0) / (pass_count + fail_count));
            end
        end

        $display("\n===== CHECKERBOARD VERIFICATION SUMMARY =====");
        $display("Total pixels verified: %0d", pass_count + fail_count);
        $display("Passed: %0d", pass_count);
        $display("Failed: %0d", fail_count);
        $display("Pass rate: %0.2f%%", (pass_count * 100.0) / (pass_count + fail_count));
        
        if (fail_count == 0)
            $display("VERIFICATION PASSED: All checked pixels match expected checkerboard pattern");
        else
            $display("VERIFICATION FAILED: %0d pixels did not match expected pattern", fail_count);
        
        $display("Time=%t: Simulation complete", $time);
        $finish;
    end

endmodule