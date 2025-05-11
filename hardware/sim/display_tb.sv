`timescale 1 ps / 1 ps

module displayTb;

    // Parameters
    parameter CLK_PERIOD = 20; // Clock period in ns (50 MHz)
    
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
    
    // Counters for monitoring
    int frame_count = 0;
    int pixel_count = 0;
    logic prev_VS;

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
    
    // Task to write to the framebuffer
    task write_pixel_word(input logic [14:0] addr, input logic [31:0] data);
        @(posedge clk);
        address = addr;
        writedata = data;
        write = 1;
        chipselect = 1;
        @(posedge clk);
        write = 0;
        chipselect = 0;
    endtask
    
    // Task to fill the entire framebuffer with a pattern
    task fill_framebuffer(input logic [31:0] pattern);
        for (int i = 0; i < 32768; i++) begin
            write_pixel_word(i, pattern);
        end
    endtask
    
    // Task to draw a horizontal line
    task draw_horizontal_line(input int row, input logic [31:0] pattern);
        // Each row is 40 words wide (1280/32)
        int base_addr = row * 40;
        for (int i = 0; i < 40; i++) begin
            write_pixel_word(base_addr + i, pattern);
        end
    endtask
    
    // Task to draw a vertical line
    task draw_vertical_line(input int col, input logic value);
        // For a vertical line, we need to set the same bit in each row
        int bit_pos = col % 32;
        int word_pos = col / 32;
        logic [31:0] pattern = (32'h1 << bit_pos);
        
        for (int row = 0; row < 480; row++) begin
            int addr = row * 40 + word_pos;
            logic [31:0] current_data;
            
            // Read-modify-write
            if (value)
                write_pixel_word(addr, pattern);
            else
                write_pixel_word(addr, ~pattern);
        end
    endtask
    
    // Task to draw a circle
    task draw_circle(input int center_x, input int center_y, input int radius);
        int x, y;
        int r_squared = radius * radius;
        
        for (int y_offset = -radius; y_offset <= radius; y_offset++) begin
            y = center_y + y_offset;
            if (y < 0 || y >= 480) continue;
            
            for (int x_offset = -radius; x_offset <= radius; x_offset++) begin
                x = center_x + x_offset;
                if (x < 0 || x >= 1280) continue;
                
                if ((x_offset*x_offset + y_offset*y_offset) <= r_squared) begin
                    int bit_pos = x % 32;
                    int word_pos = x / 32;
                    int addr = y * 40 + word_pos;
                    logic [31:0] pattern = (32'h1 << bit_pos);
                    
                    // Set the pixel
                    write_pixel_word(addr, pattern);
                end
            end
        end
    endtask
    
    // Monitor for frame counting
    always @(posedge clk) begin
        prev_VS <= VGA_VS;
        if (!prev_VS && VGA_VS) begin
            frame_count++;
            $display("Time=%t: Frame %0d complete", $time, frame_count);
        end
    end
    
    // Monitor active pixels (for debugging)
    always @(posedge VGA_CLK) begin
        if (VGA_BLANK_n) begin
            if (VGA_R != 0 || VGA_G != 0 || VGA_B != 0) begin
                pixel_count++;
            end
        end
    end
    
    // Main test sequence
    initial begin
        // For better time printing
        $timeformat(-9, 2, " ns", 10);
        
        // Initialize inputs
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
        
        // ---- Test Case 1: Fill the entire framebuffer with all ones ----
        $display("Time=%t: Test Case 1 - Fill screen with all pixels on", $time);
        fill_framebuffer(32'hFFFFFFFF);
        
        // Wait for the pattern to be visible for a few frames
        #(CLK_PERIOD * 200000); // Wait ~2 frames at 60Hz
        $display("Time=%t: Test Case 1 complete, observed %0d active pixels", $time, pixel_count);
        pixel_count = 0;
        
        // ---- Test Case 2: Clear the entire framebuffer ----
        $display("Time=%t: Test Case 2 - Clear screen (all pixels off)", $time);
        fill_framebuffer(32'h00000000);
        
        // Wait for the pattern to be visible
        #(CLK_PERIOD * 200000);
        $display("Time=%t: Test Case 2 complete, observed %0d active pixels", $time, pixel_count);
        pixel_count = 0;
        
        // ---- Test Case 3: Horizontal lines pattern ----
        $display("Time=%t: Test Case 3 - Horizontal lines pattern", $time);
        fill_framebuffer(32'h00000000); // Start with clear screen
        
        // Draw horizontal lines every 40 pixels
        for (int y = 0; y < 480; y += 40) begin
            draw_horizontal_line(y, 32'hFFFFFFFF);
        end
        
        // Wait for the pattern to be visible
        #(CLK_PERIOD * 200000);
        $display("Time=%t: Test Case 3 complete, observed %0d active pixels", $time, pixel_count);
        pixel_count = 0;
        
        // ---- Test Case 4: Vertical lines pattern ----
        $display("Time=%t: Test Case 4 - Vertical lines pattern", $time);
        fill_framebuffer(32'h00000000); // Start with clear screen
        
        // Draw vertical lines every 40 pixels
        for (int x = 0; x < 1280; x += 40) begin
            draw_vertical_line(x, 1);
        end
        
        // Wait for the pattern to be visible
        #(CLK_PERIOD * 200000);
        $display("Time=%t: Test Case 4 complete, observed %0d active pixels", $time, pixel_count);
        pixel_count = 0;
        
        // ---- Test Case 5: Circle pattern ----
        $display("Time=%t: Test Case 5 - Circle pattern", $time);
        fill_framebuffer(32'h00000000); // Start with clear screen
        
        // Draw circles at various positions
        draw_circle(640, 240, 200);  // Center
        draw_circle(320, 120, 100);  // Top-left
        draw_circle(960, 120, 100);  // Top-right
        draw_circle(320, 360, 100);  // Bottom-left
        draw_circle(960, 360, 100);  // Bottom-right
        
        // Wait for the pattern to be visible
        #(CLK_PERIOD * 200000);
        $display("Time=%t: Test Case 5 complete, observed %0d active pixels", $time, pixel_count);
        
        // ---- Test Case 6: Checkerboard pattern ----
        $display("Time=%t: Test Case 6 - Checkerboard pattern", $time);
        fill_framebuffer(32'h00000000); // Start with clear screen
        
        // Create a checkerboard pattern (alternating 32-bit words)
        for (int y = 0; y < 480; y++) begin
            logic [31:0] pattern = (y % 2) ? 32'hAAAAAAAA : 32'h55555555;
            for (int x = 0; x < 40; x++) begin
                int addr = y * 40 + x;
                write_pixel_word(addr, pattern);
                pattern = ~pattern; // Alternate pattern
            end
        end
        
        // Wait for the pattern to be visible
        #(CLK_PERIOD * 200000);
        $display("Time=%t: Test Case 6 complete", $time);
        
        // End simulation
        $display("Time=%t: Simulation complete after %0d frames", $time, frame_count);
        $finish;
    end
    
    // Optional: Monitor sync signals for debugging
    initial begin
        $monitor("Time=%t: VS=%b HS=%b BLANK=%b", $time, VGA_VS, VGA_HS, VGA_BLANK_n);
    end

endmodule