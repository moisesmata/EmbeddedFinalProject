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
    parameter BODIES = 512;
    parameter DATA_WIDTH = 64;
    parameter ADDR_WIDTH = 16;
    parameter BODY_ADDR_WIDTH = $clog2(BODIES);
    parameter MultTime = 11, // Number of cycles for mult
    parameter AddTime = 20, // Number of cycles for add/sub 
    parameter InvSqrtTime = 27 // Number of cycles for invsqert
)(
    input logic clk,
    input logic rst,
    input logic [DATA_WIDTH-1:0] write_data,
    input logic read,
    input logic write,
    input logic [ADDR_WIDTH-1:0] addr,
    input logic chipselect,
    output logic read_data[DATA_WIDTH-1:0]
);

    logic go;
    logic done;
    logic read;
    logic [$clog2(BODIES)-1:0] num_bodies;
    logic [DATA_WIDTH-1:0] gap, gap_counter;
    logic [DATA_WIDTH-1:0] write_mem;
    logic wren_x, wren_y, wren_m, wren_vx, wren_vy;
    logic [DATA_WIDTH-1:0] out_x, out_y, out_m, out_vx, out_vy;
    logic [1:0] state;
    logic [BODY_ADDR_WIDTH-1:0] body_num_i, body_num_j, v_read_or_software_or_state2_read;
    logic [BODY_ADDR_WIDTH-1:0] i_or_software_or_state2_write;
    assign i_or_software_or_state2_write = (state == 2'b00) ? body_num_i : addr[BODY_ADDR_WIDTH-1:0]; //TODO change this to do the state 2 thing
    
    logic [DATA_WIDTH-1:0] accl_x1, accl_y1, accl_x2, accl_y2, accl_m2; 
    logic [DATA_WIDTH-1:0] ax, ay;
    // Odd things will happen if you try to write when the hardware is not in a state where it expects you too, as the addresses passed into the ram will be wrong, but you will still be writing.
    logic state_2_pos_write; // This one is 0 when when we are not in state 2, if if we are, it tracks whether we are writing (based on latency of adders and such)
    logic [BODY_ADDR_WIDTH-1:0] state_2_write_loc;
    logic [BODY_ADDR_WIDTH-1:0] state_1_vrwite_j, state_1_vrwite_i;
    assign state_2_pos_write = (state == 2'b10) ? (state_2_read_loc == AddTime) : 0;
    always_ff @(posedge clk or posedge rst) begin
        //TODO: logic for letting software readn and write values goes here
        if (rst) begin
            state <= 2'b00;
            gap_counter <= 0;
            body_num_i <= 0;
            body_num_j <= 0;
        end else begin
            case (state)
                2'b00: begin // Software reading/writing 
                    //if go is not high, then we are not going to do anything (except take in writes from software)

                    // if we raised done, we are waiting for read to go high before dropping done

                    //once read and done are both low (and go is high obvisously), we can start the next cycle

                    if(go == 1) begin //handshake logic
                        if(read == 1) begin
                            done <= 0;
                        end else if (done == 0) begin
                            state <= 2'b01;
                        end
                    end
                    // zeroing out all the shit
                end
                2'b01: begin // Compute accelerations, update velocities
                    if (go == 0) begin
                        state <= 2'b00;
                    end
                    //TODO: all this bullshit
                end
                2'b10: begin // Update positions
                    state_2_read_loc <= state_2_read_loc + 1;
                    if (go == 0) begin
                        state <= 2'b00;
                    end else if (state_2_pos_write) begin
                        if (state_2_write_loc != num_bodies - 1) begin
                            state_2_write_loc <= state_2_write_loc + 1;
                        end else begin
                            state_2_write_loc <= 0;
                            if (gap_counter == gap) begin
                                state <= 2'b00;
                            end else begin
                                state <= 2'b01;
                                gap_counter <= gap_counter + 1;
                            end
                        end
                    end 
                    //TODO: zero out everything else that I need to
                end
                default: state <= 2'b00; // Default to idle state
            endcase
        end
    end
    assign wren_x = (state == 2'b00) ? ((addr[15:9] == 2'b0000011) ? write : 0) : state_2_pos_write;
    assign wren_y = (state == 2'b00) ? ((addr[15:9] == 2'b0000100) ? write : 0) : state_2_pos_write;
    assign wren_m = (addr[15:9] == 2'b0000101) ? write : 0;
    assign wren_vx = (addr[15:9] == 2'b0000110) ? write : 0;
    assign wren_vy = (addr[15:9] == 2'b0000111) ? write : 0;
    RAM2	RAM_x (
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
    RAM2	RAM_y (
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