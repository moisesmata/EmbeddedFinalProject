`timescale 1 ps / 1 ps
module nbodyTb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns (100 MHz)
    parameter MultTime = 11;   // Match DUT parameter
    parameter AddTime = 20;    // Match DUT parameter
    parameter InvSqrtTime = 27;// Match DUT parameter
    // Total latency = AddTime + MultTime + AddTime + InvSqrtTime + MultTime + MultTime + MultTime = 122 cycles
    parameter LATENCY = 122;

    logic clk, rst;
    logic [63:0] writedata, readdata, tmpdata;
    logic read, write;
    logic [15:0] addr;
    logic chipselect;
    nbody dut  (
        .clk(clk),
        .rst(rst),
        .writedata(writedata),
        .readdata(readdata),
        .read(read),
        .write(write),
        .addr(addr),
        .chipselect(chipselect)
    );
    // --- Define arrays for body data (size 22) ---
    localparam NUM_BODIES_TO_INIT = 25;
    localparam DEFINED_BODIES = 3;
    logic [31:0] read_register;

    real x_coords[NUM_BODIES_TO_INIT];
    real y_coords[NUM_BODIES_TO_INIT];
    real vx_coords[NUM_BODIES_TO_INIT];
    real vy_coords[NUM_BODIES_TO_INIT];
    real mass_values[NUM_BODIES_TO_INIT];

    // Define select codes for the upper address bits (assuming ADDR_WIDTH=16, BODY_ADDR_WIDTH=9)
    // These values should match what your nbody.sv expects for addr[15:9]
    // Registers:
    localparam GO             = 7'h00;
    localparam READ           = 7'h01;
    localparam N_BODIES       = 7'h02;
    localparam GAP            = 7'h03;
    // Memory:
    localparam X_SEL_LOWER    = 7'h04;
    localparam X_SEL_UPPER    = 7'h05;
    localparam Y_SEL_LOWER    = 7'h06;
    localparam Y_SEL_UPPER    = 7'h07;
    localparam M_SEL_LOWER    = 7'h08;
    localparam M_SEL_UPPER    = 7'h09;
    localparam VX_SEL_LOWER   = 7'h10;
    localparam VX_SEL_UPPER   = 7'h11;
    localparam VY_SEL_LOWER   = 7'h12;
    localparam VY_SEL_UPPER   = 7'h13;
    // Out:
    localparam DONE           = 7'b1000000;
    localparam READ_X_LOWER   = 7'b1000001;
    localparam READ_X_UPPER   = 7'b1000010;
    localparam READ_Y_LOWER   = 7'b1000011;
    localparam READ_Y_UPPER   = 7'b1000100;
    // Adjust BODY_ADDR_WIDTH if your nbody module supports a different number of bodies than 512
    localparam BODY_ADDR_WIDTH = 9;

    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    initial begin
        // For better time printing
        rst = 1;
        # (CLK_PERIOD * 5);
        rst = 0;
        $display("Time=%t: Deasserting reset.", $time);
        // Initialize inputs
        // # CLK_PERIOD;
        // @posedge clk;
        // Writing N_BODIES
        chipselect = 1;
        write = 1;
        read = 0;
        addr = (N_BODIES << BODY_ADDR_WIDTH);
        writedata = 64'd25;

        # (CLK_PERIOD); // Wait a cycle before starting the new sequence



        // --- Populate the first 3 elements with specific values ---
        // Body 0
        x_coords[0] = 1.0; y_coords[0] = 10.0; vx_coords[0] = 0.1; vy_coords[0] = 0.0; mass_values[0] = 1000.0;
        // Body 1
        x_coords[1] = -5.0; y_coords[1] = -15.0; vx_coords[1] = 0.0; vy_coords[1] = -0.05; mass_values[1] = 500.0;
        // Body 2
        x_coords[2] = 20.0; y_coords[2] = 0.0; vx_coords[2] = -0.2; vy_coords[2] = 0.2; mass_values[2] = 2000.0;

        // --- Populate the rest with 0s ---
        for (int i = DEFINED_BODIES; i < NUM_BODIES_TO_INIT; i++) begin
            x_coords[i] = 0.0;
            y_coords[i] = 0.0;
            vx_coords[i] = 0.0;
            vy_coords[i] = 0.0;
            mass_values[i] = 0.0; // Or a very small non-zero mass if 0 mass is problematic
        end

        // --- Write these values into the device in a loop ---
        $display("Time=%t: Starting to write %0d body initial conditions.", $time, NUM_BODIES_TO_INIT);
        for (int i = 0; i < NUM_BODIES_TO_INIT; i++) begin
            // Write Lower X coordinate
            @(posedge clk);
            chipselect = 1;
            write      = 1;
            read       = 0;
            addr       = (X_SEL_LOWER << BODY_ADDR_WIDTH) | i;
            tmpdata = $realtobits(x_coords[i]);
            writedata  = tmpdata[31:0];
            $display("Time=%t: Writing Body Lower %0d X: Addr=0x%h, Data=%f", $time, i, addr, x_coords[i]);

            // Write Upper X coordinate
            @(posedge clk);
            addr       = (X_SEL_UPPER << BODY_ADDR_WIDTH) | i;
            writedata  = tmpdata[63:32];
            $display("Time=%t: Writing Body Upper %0d X: Addr=0x%h, Data=%f", $time, i, addr, x_coords[i]);

            // Write Lower Y coordinate
            @(posedge clk);
            addr       = (Y_SEL_LOWER << BODY_ADDR_WIDTH) | i;
            tmpdata = $realtobits(y_coords[i]);
            writedata  = tmpdata[31:0];
            $display("Time=%t: Writing Body Lower %0d Y: Addr=0x%h, Data=%f", $time, i, addr, y_coords[i]);

            // Write Upper Y coordinate
            @(posedge clk);
            addr       = (Y_SEL_UPPER << BODY_ADDR_WIDTH) | i;
            writedata  = tmpdata[63:32];
            $display("Time=%t: Writing Body Upper %0d Y: Addr=0x%h, Data=%f", $time, i, addr, y_coords[i]);

            // Write Lower VX coordinate
            @(posedge clk);
            addr       = (VX_SEL_LOWER << BODY_ADDR_WIDTH) | i;
            tmpdata = $realtobits(vx_coords[i]);
            writedata  = tmpdata[31:0];
            $display("Time=%t: Writing Body Lower %0d VX: Addr=0x%h, Data=%f", $time, i, addr, vx_coords[i]);

            // Write Upper VX coordinate
            @(posedge clk);
            addr       = (VX_SEL_UPPER << BODY_ADDR_WIDTH) | i;
            writedata  = tmpdata[63:32];
            $display("Time=%t: Writing Body Upper %0d VX: Addr=0x%h, Data=%f", $time, i, addr, vx_coords[i]);

            // Write Lower VY coordinate
            @(posedge clk);
            addr       = (VY_SEL_LOWER << BODY_ADDR_WIDTH) | i;
            tmpdata = $realtobits(vy_coords[i]);
            writedata  = tmpdata[31:0];
            $display("Time=%t: Writing Body Lower %0d VY: Addr=0x%h, Data=%f", $time, i, addr, vy_coords[i]);

            // Write Upper VY coordinate
            @(posedge clk);
            addr       = (VY_SEL_UPPER << BODY_ADDR_WIDTH) | i;
            writedata  = tmpdata[63:32];
            $display("Time=%t: Writing Body Upper %0d VY: Addr=0x%h, Data=%f", $time, i, addr, vy_coords[i]);

            // Write Lower Mass
            @(posedge clk);
            addr       = (M_SEL_LOWER << BODY_ADDR_WIDTH) | i;
            tmpdata = $realtobits(mass_values[i]);
            writedata  = tmpdata[31:0];
            $display("Time=%t: Writing Body Lower %0d Mass: Addr=0x%h, Data=%f", $time, i, addr, mass_values[i]);

            // Write Upper Mass
            @(posedge clk);
            addr       = (M_SEL_UPPER << BODY_ADDR_WIDTH) | i;
            writedata  = tmpdata[63:32];
            $display("Time=%t: Writing Body Upper %0d Mass: Addr=0x%h, Data=%f", $time, i, addr, mass_values[i]);

            // Hold last write for a cycle for the DUT to see it
            #CLK_PERIOD;
        end

        /* 
        // After writing all values, de-assert control signals
        @(posedge clk);
        chipselect = 0;
        write      = 0;
        addr       = 0;
        writedata  = 0;
        $display("Time=%t: Finished writing body initial conditions.", $time);
        */

        // Assign gap value
        @(posedge clk);
            chipselect = 1'b1;
            write      = 1'b1;
            addr       = (GAP << BODY_ADDR_WIDTH);
            writedata  = 64'd6;

        //  Turn go on
        @(posedge clk);
            chipselect = 1'b1;
            write      = 1'b1;
            addr       = (GO << BODY_ADDR_WIDTH);
            writedata  = 64'b1;



        # (CLK_PERIOD * 6000); // Wait for simulation to run for a while
        $display("Time=%t: Testbench finishing.", $time);

        @(posedge clk);
            chipselect = 1'b1;
            write      = 1'b1;
            writedata  = 1'b1;
            read       = 1'b0;
            addr       = (READ << BODY_ADDR_WIDTH);

        for (int i = 0; i < 3; i++) begin

            $display("For body %i", i);
            @(posedge clk);
                chipselect = 1'b1;
                write      = 1'b0;
                writedata  = 1'b0;
                read       = 1'b1;
                addr       = (READ_X_LOWER << BODY_ADDR_WIDTH) | i;

            @(posedge clk);
                read_register = readdata;

            @(posedge clk);
                addr       = (READ_X_UPPER << BODY_ADDR_WIDTH) | i;

            @(posedge clk);
            $display("X = %f", $bitstoreal({readdata,read_register}));

            @(posedge clk);
                addr       = (READ_Y_LOWER << BODY_ADDR_WIDTH) | i;

            @(posedge clk);
                read_register = readdata;

            @(posedge clk);
                addr       = (READ_Y_UPPER << BODY_ADDR_WIDTH) | i;

            @(posedge clk);
            $display("Y = %f", $bitstoreal({readdata,read_register}));
        end
        @(posedge clk);
        @(posedge clk);
            chipselect = 1'b1;
            write      = 1'b1;
            addr       = (READ << BODY_ADDR_WIDTH);
            writedata  = 64'b0;
        # (CLK_PERIOD * 6000); // Wait for simulation to run for a while
        $display("Time=%t: Testbench finishing for Gap 2.", $time);

        @(posedge clk);
            chipselect = 1'b1;
            write      = 1'b1;
            writedata  = 1'b1;
            read       = 1'b0;
            addr       = (READ << BODY_ADDR_WIDTH);

        for (int i = 0; i < 3; i++) begin
            $display("For body %i", i);
            @(posedge clk);
                chipselect = 1'b1;
                write      = 1'b0;
                writedata  = 1'b0;
                read       = 1'b1;
                addr       = (READ_X_LOWER << BODY_ADDR_WIDTH) | i;

            @(posedge clk);
                read_register = readdata;

            @(posedge clk);
                addr       = (READ_X_UPPER << BODY_ADDR_WIDTH) | i;

            @(posedge clk);
                $display("X = %f", $bitstoreal({readdata,read_register}));

            @(posedge clk);
                addr       = (READ_Y_LOWER << BODY_ADDR_WIDTH) | i;

            @(posedge clk);
                read_register = readdata;

            @(posedge clk);
                addr       = (READ_Y_UPPER << BODY_ADDR_WIDTH) | i;
                
            @(posedge clk);
            $display("Y = %f", $bitstoreal({readdata,read_register}));


        end
        @(posedge clk);
        @(posedge clk);
            chipselect = 1'b1;
            write      = 1'b1;
            addr       = (READ << BODY_ADDR_WIDTH);
            writedata  = 64'b0;
        $finish;

    end

endmodule
