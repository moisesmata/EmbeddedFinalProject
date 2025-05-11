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
        
        // Test: Fill entire framebuffer with all 1's (all pixels on)
        $display("Time=%t: Starting to fill framebuffer with all pixels on", $time);
        
        // Loop through all 32K addresses in the framebuffer (0x0000 to 0x7FFF)
        for (int i = 0; i < 32768; i++) begin
            @(posedge clk);
            chipselect = 1;
            write = 1;
            address = i[14:0];  // 15-bit address
            writedata = 32'hFFFFFFFF;  // All bits on
            
            // Every 1000 addresses, print progress
            if (i % 1000 == 0) begin
                $display("Time=%t: Writing address 0x%h with 0xFFFFFFFF", $time, i);
            end
            
            // Hold for one clock cycle
            @(posedge clk);
        end
        
        // Release control signals
        chipselect = 0;
        write = 0;
        
        $display("Time=%t: Finished filling framebuffer", $time);
        
        // Wait for a few frames to observe the display
        #(CLK_PERIOD * 20000);
        
        // Now test: Fill entire framebuffer with all 0's (all pixels off)
        $display("Time=%t: Starting to clear framebuffer (all pixels off)", $time);
        
        // Loop through all addresses again
        for (int i = 0; i < 9600; i++) begin
            @(posedge clk);
            chipselect = 1;
            write = 1;
            address = i[14:0];
            writedata = 32'h00000000;  // All bits off
            
            // Every 1000 addresses, print progress
            if (i % 1000 == 0) begin
                $display("Time=%t: Writing address 0x%h with 0x00000000", $time, i);
            end
            
            // Hold for one clock cycle
            @(posedge clk);
        end
        
        // Release control signals
        chipselect = 0;
        write = 0;
        
        $display("Time=%t: Finished clearing framebuffer", $time);
        
        // Wait for a few frames to observe the display
        #(CLK_PERIOD * 20000);
        
        // Add a simple monitor for the VGA signals
        $display("Time=%t: Final VGA signals: VS=%b HS=%b BLANK=%b", 
                $time, VGA_VS, VGA_HS, VGA_BLANK_n);
                
        $display("Time=%t: Simulation complete", $time);
        $finish;
    end

endmodule