
`timescale 1 ps / 1 ps
module nBodyTb;

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

        // Initialize inputs (using floating point representation)
        rst = 1;
        x1 = $realtobits(0.0); y1 = $realtobits(0.0); z1 = $realtobits(0.0);
        x2 = $realtobits(0.0); y2 = $realtobits(0.0); m2 = $realtobits(0.0);

        // Apply reset
        # (CLK_PERIOD * 5);
        rst = 0;
        $display("Time=%t: Deasserting reset.", $time);

        // Wait for reset to propagate
        # (CLK_PERIOD);
	@(posedge clk);

        // --- Test Case 1 ---
        $display("Time=%t: Applying Test Case 1", $time);
        x1 = $realtobits(10.0); y1 = $realtobits(20.0); z1 = $realtobits(0.0);
        x2 = $realtobits(0.0); y2 = $realtobits(0.0); m2 = $realtobits(500.0); // Example values
        # (CLK_PERIOD * (1)); // Wait for output + margin
        x1 = $realtobits(10.0); y1 = $realtobits(100.0); z1 = $realtobits(0.0);
        x2 = $realtobits(0.0); y2 = $realtobits(0.0); m2 = $realtobits(400.0); // Example values
	# (CLK_PERIOD * (1)); // Wait for output + margin
        x1 = $realtobits(10.0); y1 = $realtobits(-10.0); z1 = $realtobits(0.0);
        x2 = $realtobits(0.0); y2 = $realtobits(0.0); m2 = $realtobits(300.0); // Example values
	# (CLK_PERIOD * (1)); // Wait for output + margin
        x1 = $realtobits(-100.0); y1 = $realtobits(10.0); z1 = $realtobits(0.0);
        x2 = $realtobits(0.0); y2 = $realtobits(0.0); m2 = $realtobits(200.0); // Example values
	# (CLK_PERIOD * (1)); // Wait for output + margin
        x1 = $realtobits(1000.0); y1 = $realtobits(1000.0); z1 = $realtobits(0.0);
        x2 = $realtobits(0.0); y2 = $realtobits(0.0); m2 = $realtobits(100000000000.0); // Example values
	# (CLK_PERIOD * (1)); // Wait for output + margin




        // --- Test Case 2 ---
        $display("Time=%t: Applying Test Case 2", $time);
        x1 = $realtobits(5.0); y1 = $realtobits(5.0); z1 = $realtobits(0.0);
        x2 = $realtobits(-5.0); y2 = $realtobits(-5.0); m2 = $realtobits(200.0); // Example values
        # (CLK_PERIOD * (LATENCY + 10)); // Wait for output + margin

        // --- Test Case 3 ---
        $display("Time=%t: Applying Test Case 3", $time);
        x1 = $realtobits(1.0); y1 = $realtobits(2.0); z1 = $realtobits(3.0);
        x2 = $realtobits(4.0); y2 = $realtobits(5.0); m2 = $realtobits(50.0); // Example values
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
