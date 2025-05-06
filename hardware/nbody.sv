// This module is the wrapper for the entire system. It will take in values from the bus
// write to its memories, and call getaccl and leapfrog
//
// Lower 9 (log2 BODIES) bits are body number
// Upper 7 (16 - log2 BODIES) bits other params
// 0000000 = GO
// 0000001 = READ
// 0000010 = N_BODIES
// 0001000 = GAP
// 0000011 = WRITE_X
// 0000100 = WRITE_Y
// 0000101 = WRITE_M
// 0000110 = WRITE_VX
// 0000111 = WRITE_VY

// 1000000 = DONE
// 1000001 = READ_X
// 1000010 = READ_Y



module nbody #(
    parameter BODIES = 512,
    parameter DATA_WIDTH = 64,
    parameter ADDR_WIDTH = 16,
    parameter BODY_ADDR_WIDTH = $clog2(BODIES),
    parameter MultTime = 11, // Number of cycles for mult
    parameter AddTime = 20, // Number of cycles for add/sub 
    parameter InvSqrtTime = 27, // Number of cycles for invsqert
    parameter AcclLatency = AddTime + MultTime + AddTime + InvSqrtTime + MultTime * 4 + 1, // The one is for the startup thing we need to do to confirm we dont devide by 0
    parameter MinBodies = 21
)(
    input logic clk,
    input logic rst,
    input logic [DATA_WIDTH-1:0] writedata,
    input logic read,
    input logic write,
    input logic [ADDR_WIDTH-1:0] addr,
    input logic chipselect,
    output logic [DATA_WIDTH-1:0] readdata
);

    localparam SW_READ_WRITE = 2'b00;
    localparam CALC_ACCEL = 2'b01;
    localparam UPDATE_POS = 2'b10;
    // Assuming sub == add
    localparam totAccelTime = (AddTime * 2) + (MultTime * 5) + InvSqrtTime;

    logic go;
    logic done;
    logic read_sw;
    logic [$clog2(BODIES)-1:0] num_bodies;
    logic [DATA_WIDTH-1:0] gap, gap_counter;
    logic [DATA_WIDTH-1:0] write_vx, write_vy, write_x, write_y;
    logic wren_x, wren_y, wren_m, wren_vx, wren_vy;
    logic [DATA_WIDTH-1:0] out_x, out_y, out_m, out_vx, out_vy;
    logic [1:0] state;
    logic [BODY_ADDR_WIDTH-1:0] v_read_or_software_or_state2_read;
    logic [BODY_ADDR_WIDTH-1:0] i_or_software_or_state2_write;
    logic [BODY_ADDR_WIDTH-1:0] s1_body_num_i_read, s1_body_num_j_read;
    logic [BODY_ADDR_WIDTH-1:0] j_or_state2_read;
    logic [BODY_ADDR_WIDTH-1:0] s1_counter;
    
    logic [DATA_WIDTH-1:0] accl_x1, accl_y1, accl_x2, accl_y2, accl_m2; 
    logic [DATA_WIDTH-1:0] ax, ay;
    logic [DATA_WIDTH-1:0] out_i_x, out_i_y, out_j_x, out_j_y; 
    // Odd things will happen if you try to write when the hardware is not in a state where it expects you too, as the addresses passed into the ram will be wrong, but you will still be writing.
    logic state_2_pos_write; // This one is 0 when when we are not in state 2, if if we are, it tracks whether we are writing (based on latency of adders and such)
    logic [BODY_ADDR_WIDTH-1:0] state_2_write_loc, state_2_read_loc, vwrite_or_software;

    logic endstate;

    logic first_time;

    logic [BODY_ADDR_WIDTH-1:0] state_1_vrwite_j, state_1_vrwite_i, state_1_read_j, state_1_read_i;

    always_ff @(posedge clk or posedge rst) begin
        //TODO: logic for letting software read and write values goes here
        if (rst) begin
            state <= SW_READ_WRITE;
            gap_counter <= 0;
            s1_body_num_i_read <= 0;
            s1_body_num_j_read <= 0;
        end else begin
            state_1_vrwite_i <= 0;
            state_1_vrwite_j <= 0;
            state_1_read_j <= 0;
            state_1_read_i <= 0;
            state_2_write_loc <= 0;
            state_2_read_loc <= 0;
            if (read == 1) begin
                if (addr[15:9] == 7'b1000000) begin
                    readdata <= {{(DATA_WIDTH-1){1'b0}}, done};
                end else if (addr[15:9] == 7'b1000001) begin
                    readdata <=  out_i_x;
                end else if (addr[15:9] == 7'b1000010) begin
                    readdata <= out_i_y;
                end
            end
            if (write == 1) begin
                if (addr[15:9] == 7'b0000000) begin
                    go <= writedata[0];
                end else if (addr[15:9] == 7'b0000001) begin
                    read_sw <= writedata[0];
                end else if (addr[15:9] == 7'b0000010) begin
                    num_bodies <= writedata[BODY_ADDR_WIDTH-1:0];
                end else if (addr[15:9] == 7'b0001000) begin
                    gap <= writedata[BODY_ADDR_WIDTH-1:0];
                end 
            end

            case (state)
                SW_READ_WRITE: begin // Software reading/writing 
                    //if go is not high, then we are not going to do anything (except take in writes from software)
                    // if we raised done, we are waiting for read to go high before dropping done
                    //once read and done are both low (and go is high obvisously), we can start the next cycle
                    i_or_software_or_state2_write <= addr[BODY_ADDR_WIDTH-1:0];
                    write_x <= writedata;
                    write_y <= writedata;
                    write_vx <= writedata;
                    write_vy <= writedata;
                    if(go == 1) begin //handshake logic
                        if(read_sw == 1) begin
                            done <= 0;
                        end else if (done == 0) begin
                            state <= CALC_ACCEL;
                        end
                    end
                    else begin
                        first_time <= 1;
                        done <= 1;
                    end
                    // zeroing out all the shit
                    
                end
                CALC_ACCEL: begin // Compute accelerations, update velocities
                    i_or_software_or_state2_write <= s1_body_num_i_read;
                    if (go == 0) begin
                        state <= SW_READ_WRITE;
                    end
                    else if () begin
                        // Finished, start UPDATE_POS
                        state <= UPDATE_POS;
                    end
                    else begin
                        // Actually running.
                        // By default, s1_body_num_j_read increases by 1
                        s1_body_num_j_read <= s1_body_num_j_read + 1;
                        if (s1_body_num_j_read == num_bodies - 1) begin
                            // Check if we have gone through all the bodies, if
                            // not update i and j.

                            // If this is not the case, we dont really case, as we will never see those outputs because of the trailer.

                            if (s1_body_num_i_read != num_bodies - 1) begin
                                // We have reached the final body_j. Increment
                                // i and reset j
                                s1_body_num_i_read <= s1_body_num_i_read + 1;
                                s1_body_num_j_read <= 0;
                            end
                        end
                    end
                    // TODO: NEED TO GIT RID OF THIS, JUST FOR TESTING N SHIT
                    write_vx <= ax;
                    write_vy <= ay;
                    
                end
                UPDATE_POS: begin // Update positions
                    i_or_software_or_state2_write <= state_2_write_loc;
                    state_2_read_loc <= state_2_read_loc + 1;
                    if (go == 0) begin
                        state <= SW_READ_WRITE;
                    if (state_2_read_loc == AddTime) begin
                        // finished the startup time, now we can start writing things back
                        state_2_pos_write <= 1;
                    end
                    end else if (state_2_pos_write) begin
                        if (vwrite_or_software != num_bodies - 1) begin
                            vwrite_or_software <= vwrite_or_software + 1;

                        end else begin
                            state_2_write_loc <= 0;
                            if (gap_counter == gap) begin
                                state <= SW_READ_WRITE;
                            end else begin
                                state <= CALC_ACCEL;
                                gap_counter <= gap_counter + 1;
                            end
                        end
                    end else begin
                        vwrite_or_software <= 0;
                    end
                    // TODO: Get rid of this, just for testing
                    write_x <= out_vx;
                    write_y <= out_vy;
                    //TODO: zero out everything else that I need to
                end
                default: state <= SW_READ_WRITE; // Default to idle state
            endcase
        end
    end
    // Write enable for software
    assign wren_x = (state == SW_READ_WRITE) ? ((addr[15:9] == 7'b0000011) ? write : 0) : state_2_pos_write;
    assign wren_y = (state == SW_READ_WRITE) ? ((addr[15:9] == 7'b0000100) ? write : 0) : state_2_pos_write;
    assign wren_m = (addr[15:9] == 7'b0000101) ? write : 0;
    assign wren_vx = (addr[15:9] == 7'b0000110) ? write : 0;
    assign wren_vy = (addr[15:9] == 7'b0000111) ? write : 0;
    RAM2	RAM_x(
        .clock ( clk ),
        .address_a ( i_or_software_or_state2_write ),
        .address_b ( j_or_state2_read ),
        .data_a ( write_x ),
        .data_b ( 64'b0 ),
        .wren_a ( wren_x ),
        .wren_b ( 0 ),
        .q_a ( out_i_x ),
        .q_b ( out_j_x )
	);
    RAM2    RAM_y(
        .clock ( clk ),
        .address_a ( i_or_software_or_state2_write ),
        .address_b ( j_or_state2_read ),
        .data_a ( write_y ),
        .data_b ( 64'b0 ),
        .wren_a ( wren_y ),
        .wren_b ( 0 ),
        .q_a ( out_i_y ),
        .q_b ( out_j_y )
	);
    RAM	RAM_m (
        .clock ( clk ),
        .data ( writedata ),
        .rdaddress ( s1_body_num_j_read ),
        .wraddress ( addr[BODY_ADDR_WIDTH-1:0] ),
        .wren ( wren_m ),
        .q ( out_m )
	);
    RAM	RAM_vx (
        .clock ( clk ),
        .data ( write_vy ),
        .rdaddress ( v_read_or_software_or_state2_read ),
        .wraddress ( vwrite_or_software ),
        .wren ( wren_vx ),
        .q ( out_vx )
	);
    RAM	RAM_vy (
        .clock ( clk ),
        .data ( write_vx ),
        .rdaddress ( v_read_or_software_or_state2_read ),
        .wraddress ( vwrite_or_software ),
        .wren ( wren_vy ),
        .q ( out_vy )
	);
    
    getAccl #(
        .MultTime(MultTime),
        .AddTime(AddTime),
        .InvSqrtTime(InvSqrtTime)
    ) accl (
        .rst(rst), // NOT CORRECT TODO
        .clk(clk),
        .x1(out_i_x),
        .y1(out_i_y),
        .x2(out_j_x),
        .y2(out_j_y),
        .m2(out_m),
        .ax(ax),
        .ay(ay)
    );

endmodule
