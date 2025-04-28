`timescale 1ns/1ps

module getAccl_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns (100 MHz)
    parameter MultTime = 11;   // Match DUT parameter
    parameter AddTime = 20;    // Match DUT parameter
    parameter InvSqrtTime = 27;// Match DUT parameter
    // Total latency = AddTime + MultTime + AddTime + InvSqrtTime + MultTime + MultTime + MultTime = 122 cycles
    parameter LATENCY = 122;

    // Testbench Signals
    logic clk;
    logic rst;
    logic [63:0] x1, y1, z1;
    logic [63:0] x2, y2, m2;
    logic [63:0] ax, ay;

    // Instantiate the Design Under Test (DUT)
    getAccl #(
        .MultTime(MultTime),
        .AddTime(AddTime),
        .InvSqrtTime(InvSqrtTime)
    ) dut (
        .rst(rst),
        .clk(clk),
        .x1(x1),
        .y1(y1),
        .z1(z1), // z1 is an input to the module but not used in the provided logic
        .x2(x2),
        .y2(y2),
        .m2(m2),
        .ax(ax),
        .ay(ay)
        // az is not an output of the provided module
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // Reset and Stimulus Generation
    initial begin
        // For better time printing
        $timeformat(-9, 2, " ns", 10);

        // Initialize inputs
        rst = 1;
        x1 = 64'd0; y1 = 64'd0; z1 = 64'd0;
        x2 = 64'd0; y2 = 64'd0; m2 = 64'd0;

        // Apply reset
        # (CLK_PERIOD * 5);
        rst = 0;
        $display("Time=%t: Deasserting reset.", $time);

        // Wait for reset to propagate
        # (CLK_PERIOD);

        // --- Test Case 1 ---
        $display("Time=%t: Applying Test Case 1", $time);
        x1 = 64'd10; y1 = 64'd0; z1 = 64'd0;
        x2 = 64'd0; y2 = 64'd0; m2 = 64'd100; // Example values
        # (CLK_PERIOD * (LATENCY + 10)); // Wait for output + margin

        // --- Test Case 2 ---
        $display("Time=%t: Applying Test Case 2", $time);
        x1 = 64'd5; y1 = 64'd5; z1 = 64'd0;
        x2 = 64'd-5; y2 = 64'd-5; m2 = 64'd200; // Example values
        # (CLK_PERIOD * (LATENCY + 10)); // Wait for output + margin

        // --- Test Case 3 ---
        $display("Time=%t: Applying Test Case 3", $time);
        x1 = 64'd1; y1 = 64'd2; z1 = 64'd3;
        x2 = 64'd4; y2 = 64'd5; m2 = 64'd50; // Example values
        # (CLK_PERIOD * (LATENCY + 10)); // Wait for output + margin

        $display("Time=%t: Simulation finished.", $time);
        $finish;
    end

    // Monitoring (Optional: Can be verbose)
    // initial begin
    //     $monitor("Time=%t rst=%b x1=%d y1=%d x2=%d y2=%d m2=%d -> ax=%d ay=%d",
    //              $time, rst, x1, y1, x2, y2, m2, ax, ay);
    // end

endmodule
