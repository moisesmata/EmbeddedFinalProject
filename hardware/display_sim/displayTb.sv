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
        
        // Test 1: Write checkerboard pattern to framebuffer
        $display("Time=%t: Starting to write checkerboard pattern to framebuffer", $time);
        
        // Loop through pixel rows in blocks of 32 pixels (one word)
        for (int y = 0; y < DISPLAY_HEIGHT; y++) begin
            // Loop through pixel columns in blocks of 32 pixels
            for (int x = 0; x < DISPLAY_WIDTH; x += 32) begin
                // Construct a 32-bit word with the appropriate checkerboard pattern
                logic [31:0] pattern_word = 0;
                
                for (int bit_idx = 0; bit_idx < 32; bit_idx++) begin
                    if (x + bit_idx < DISPLAY_WIDTH) begin // Fixed syntax error with curly brace
                        // Set the bit according to checkerboard pattern
                        if (get_expected_pixel(x + bit_idx, y))
                            pattern_word[bit_idx] = 1'b1;
                    end
                end
                
                // Calculate the address for this 32-bit word
                int addr = (y * (DISPLAY_WIDTH / 32)) + (x / 32);
                
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
        
        // Add this after the "Finished writing checkerboard pattern" message
        $display("Time=%t: Starting comprehensive verification of all pixels", $time);

        // Variables to track test results
        int pass_count = 0;
        int fail_count = 0;

        // Check every pixel
        for (int y = 0; y < DISPLAY_HEIGHT; y++) begin
            for (int x = 0; x < DISPLAY_WIDTH; x++) begin
                // Only print a few rows for debug visibility
                logic verbose = (y % 100 == 0 && x % 100 == 0);
                
                // Use your existing verification mechanism but with less logging
                logic expected = get_expected_pixel(x, y);
                
                // Force DUT to display this point
                force dut.hcount = {x[9:0], 1'b0}; // Fixed: Properly formatting 11-bit hcount
                force dut.vcount = y;
                
                // Allow time to propagate
                #(CLK_PERIOD * 1);
                
                // Check result
                logic actual = (VGA_R == 8'hFF) ? 1'b1 : 1'b0;
                if (actual == expected) begin
                    pass_count++;
                    if (verbose) $display("PASS: Pixel (%0d,%0d)", x, y);
                end else begin
                    fail_count++;
                    // Always print failures
                    $display("FAIL: Pixel (%0d,%0d) - expected %0b, got %0b", 
                            x, y, expected, actual);
                end
                
                // Release the forced values
                release dut.hcount;
                release dut.vcount;
            end
            
            // Print progress for every row
            if (y % 20 == 0) begin
                $display("Verified %0d rows, %0d/%0d pixels passed (%0.2f%%)", 
                        y, pass_count, pass_count + fail_count,
                        (pass_count * 100.0) / (pass_count + fail_count));
            end
        end

        $display("Verification complete: %0d pixels passed, %0d failed (%0.2f%% pass rate)", 
                pass_count, fail_count, (pass_count * 100.0) / (pass_count + fail_count));
        
        // Wait for pattern to display
        #(CLK_PERIOD * 20000);
        
        // Verification phase: Read and verify select points to ensure checkerboard pattern
        $display("Time=%t: Starting verification of checkerboard pattern", $time);
        
        // Test specific test points - choose points known to be in different squares
        verify_point(0, 0);     // Should be white (1) if top-left is white
        verify_point(25, 5);    // Should be black (0) - different square
        verify_point(45, 5);    // Should be white (1) - different square
        verify_point(5, 25);    // Should be black (0) - different square
        verify_point(45, 45);   // Should be white (1) - different square
        
        $display("Time=%t: Verification complete", $time);
        
        // Clear the framebuffer
        $display("Time=%t: Clearing framebuffer", $time);
        
        for (int i = 0; i < (DISPLAY_WIDTH * DISPLAY_HEIGHT / 32); i++) begin
            @(posedge clk);
            chipselect = 1;
            write = 1;
            address = i[14:0];
            writedata = 32'h00000000;
            
            if (i % 1000 == 0) begin
                $display("Time=%t: Clearing address 0x%h", $time, i);
            end
            
            @(posedge clk);
        end
        
        chipselect = 0;
        write = 0;
        
        $display("Time=%t: Framebuffer cleared", $time);
        
        // Wait to observe cleared display
        #(CLK_PERIOD * 10000);
        
        $display("Time=%t: Final VGA signals: VS=%b HS=%b BLANK=%b", 
                $time, VGA_VS, VGA_HS, VGA_BLANK_n);
                
        $display("Time=%t: Simulation complete", $time);
        $finish;
    end
    
    // Task to verify a specific point matches the expected checkerboard pattern
    task verify_point(int x, int y);
        logic expected = get_expected_pixel(x, y);
        
        // Calculate which word and bit contains this pixel
        int word_addr = (y * (DISPLAY_WIDTH / 32)) + (x / 32);
        int bit_pos = x % 32;
        
        // Force DUT to display this point (simulating a VGA scan)
        force dut.hcount = {x[9:0], 1'b0}; // Fixed: Properly formatting 11-bit hcount
        force dut.vcount = y;
        
        // Wait a few cycles for the pixel value to propagate
        #(CLK_PERIOD * 2);
        
        // Check if the displayed pixel matches our expectation
        if ((VGA_R == 8'hFF && expected == 1'b1) || 
            (VGA_R == 8'h00 && expected == 1'b0)) begin
            $display("Time=%t: PASS - Pixel at (%0d,%0d) is %s as expected", 
                     $time, x, y, expected ? "white" : "black");
        end else begin
            $display("Time=%t: FAIL - Pixel at (%0d,%0d) should be %s but is %s", 
                     $time, x, y, expected ? "white" : "black", 
                     (VGA_R == 8'hFF) ? "white" : "black");
            // Print debug information
            $display("  Debug: word_addr=%0d, bit_pos=%0d, expected=%b", 
                     word_addr, bit_pos, expected);
        end
        
        // Release the forced values
        release dut.hcount;
        release dut.vcount;
    endtask

endmodule