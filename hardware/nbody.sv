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
    parameter InvSqrtTime = 27 // Number of cycles for invsqert
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
    logic [DATA_WIDTH-1:0] write_mem;
    logic wren_x, wren_y, wren_m, wren_vx, wren_vy;
    logic [DATA_WIDTH-1:0] out_x, out_y, out_m, out_vx, out_vy;
    logic [1:0] state;
    logic [BODY_ADDR_WIDTH-1:0] v_read_or_software_or_state2_read;
    logic [BODY_ADDR_WIDTH-1:0] i_or_software_or_state2_write;
    assign i_or_software_or_state2_write = (state == SW_READ_WRITE) ? body_num_i : addr[BODY_ADDR_WIDTH-1:0]; //TODO change this to do the state 2 thing
    
    logic [DATA_WIDTH-1:0] accl_x1, accl_y1, accl_x2, accl_y2, accl_m2; 
    logic [DATA_WIDTH-1:0] ax, ay;
    // Odd things will happen if you try to write when the hardware is not in a state where it expects you too, as the addresses passed into the ram will be wrong, but you will still be writing.
    logic state_2_pos_write; // This one is 0 when when we are not in state 2, if if we are, it tracks whether we are writing (based on latency of adders and such)
    logic [BODY_ADDR_WIDTH-1:0] state_2_write_loc, state_2_read_loc;

    logic [BODY_ADDR_WIDTH-1:0] state_1_vrwite_j, state_1_vrwite_i, state_1_read_j, state_1_read_i;
    assign state_2_pos_write = (state == UPDATE_POS) ? (state_2_read_loc == AddTime) : 0;

    always_ff @(posedge clk or posedge rst) begin
        //TODO: logic for letting software read and write values goes here
        if (rst) begin
            state <= SW_READ_WRITE;
            gap_counter <= 0;
        end else begin
            state_1_vrwite_i <= 0;
            state_1_vrwite_j <= 0;
            state_1_read_j <= 0;
            state_1_read_i <= 0;
            state_2_write_loc <= 0;
            state_2_read_loc <= 0;
            case (state)
                SW_READ_WRITE: begin // Software reading/writing 
                    //if go is not high, then we are not going to do anything (except take in writes from software)
                    // if we raised done, we are waiting for read to go high before dropping done
                    //once read and done are both low (and go is high obvisously), we can start the next cycle

                    if(go == 1) begin //handshake logic
                        if(read_sw == 1) begin
                            done <= 0;
                        end else if (done == 0) begin
                            state <= CALC_ACCEL;
                        end
                    end
                    // zeroing out all the shit
                    
                end
                CALC_ACCEL: begin // Compute accelerations, update velocities
                    if (go == 0) begin
                        state <= SW_READ_WRITE;
                    end
                    else if (endstate) begin
                        // Finished, start UPDATE_POS
                        state <= UPDATE_POS;
                    end
                    else begin
                        // Actually running.
                        // By default, body_num_j increases by 1
                        body_num_j <= body_num_j + 1;
                        if (body_num_j == num_bodies - 1) begin
                            // Check if we have gone through all the bodies, if
                            // not update i and j.
                            if (body_num_i == num_bodies - 1) begin
                                // Finished inputs into acceleration
                            end
                            else begin
                                // We have reached the final body_j. Increment
                                // i and reset j
                                body_num_i <= body_num_i + 1;
                                body_num_j <= 0;
                            end
                        end
                    end
                end
                UPDATE_POS: begin // Update positions
                    state_2_read_loc <= state_2_read_loc + 1;
                    if (go == 0) begin
                        state <= SW_READ_WRITE;
                    end else if (state_2_pos_write) begin
                        if (state_2_write_loc != num_bodies - 1) begin
                            state_2_write_loc <= state_2_write_loc + 1;
                        end else begin
                            state_2_write_loc <= 0;
                            if (gap_counter == gap) begin
                                state <= SW_READ_WRITE;
                            end else begin
                                state <= CALC_ACCEL;
                                gap_counter <= gap_counter + 1;
                            end
                        end
                    end 
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
        .data_a ( x_data_a ),
        .data_b ( x_data_b ),
        .wren_a ( wren_x ),
        .wren_b ( 0 ),
        .q_a ( out_i_x ),
        .q_b ( out_j_x )
	);
    RAM2    RAM_y(
        .clock ( clk ),
        .address_a ( i_or_software_or_state2_write ),
        .address_b ( j_or_state2_read ),
        .data_a ( y_data_a ),
        .data_b ( y_data_b ),
        .wren_a ( wren_y ),
        .wren_b ( 0 ),
        .q_a ( out_i_y ),
        .q_b ( out_j_y )
	);
    RAM	RAM_m (
        .clock ( clk ),
        .data ( write_mem ),
        .rdaddress ( j ),
        .wraddress ( addr[BODY_ADDR_WIDTH-1:0] ),
        .wren ( wren_m ),
        .q ( out_m )
	);
    RAM	RAM_vx (
        .clock ( clk ),
        .data ( write_mem ),
        .rdaddress ( v_read_or_software_or_state2_read ),
        .wraddress ( vwrite_or_software ),
        .wren ( wren_vx ),
        .q ( out_vx )
	);
    RAM	RAM_vy (
        .clock ( clk ),
        .data ( write_mem ),
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
        .x1(accl_x1),
        .y1(accl_y1),
        .x2(accl_x2),
        .y2(accl_y2),
        .m2(accl_m2),
        .ax(ax),
        .ay(ay)
    );
endmodule
