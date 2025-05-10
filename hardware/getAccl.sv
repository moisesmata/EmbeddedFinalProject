// This module should take in the XYZ of one body, XYZ and M of the second, 
// and output AX, AY, AZ experinced by the first due to the second
// The wrapping program has to ensure that valid data is being fed in, and that it keeps track of what is coming out.
// Latency is <<INPUT THIS>> cycles

`timescale 1 ps / 1 ps

module getAccl #(
    parameter MultTime = 11, // Number of cycles for mult
    parameter AddTime = 20, // Number of cycles for add/sub 
    parameter InvSqrtTime = 27 // Number of cycles for invsqert
)(
    input logic rst,          // Reset signal
    input logic clk,          // Clock signal
    input logic [63:0] x1,    // X coordinate of the first body
    input logic [63:0] y1,    // Y coordinate of the first body
    input logic [63:0] x2,    // X coordinate of the second body
    input logic [63:0] y2,    // Y coordinate of the second body
    input logic [63:0] m2,    // Mass of the second body (premultaplied by G)
    output logic [63:0] ax,   // Acceleration in the X direction
    output logic [63:0] ay   // Acceleration in the Y di    ); rection
);
    logic [63:0] m_late, dx, dy, dx2, dy2, dx_late, dy_late, d_inv, d_inv_2, d_inv_3, f_val, d2;
    logic [63:0] d_inv_late;
    logic [63:0] x1_real, y1_real, x2_real, y2_real, m2_real;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            x1_real <= 0;
            y1_real <= 0;
            x2_real <= 1;
            y2_real <= 1;
            m2_real <= 0;
        end else begin
            y1_real <= y1;
            y2_real <= y2;
            if (x1 == x2 && y1 == y2) begin
                m2_real <= 0; // Set m2 to 0 if comparing a body to itself
                x2_real = 64'h3f800000;
                x1_real <= 64'h42c60000;
            end else begin
                m2_real <= m2;
                x2_real <= x2;
                x1_real <= x1;
            end
        end
    end

    shift_register #(.SHIFTS(AddTime + MultTime + AddTime + InvSqrtTime + MultTime * 2)) shiftM // This is 20+49+37+11+11 for each of the objects this has to pass around
    (
        .clk(clk),
        .rst(rst),
        .in(m2_real),
        .out(m_late)
    ); 
    shift_register #(.SHIFTS(MultTime + AddTime + InvSqrtTime + MultTime * 3)) shiftDX // This is 49+37+11+11 for each of the objects this has to pass around
    (
        .clk(clk),
        .rst(rst),
        .in(dx),
        .out(dx_late)
    ); 
    shift_register #(.SHIFTS(MultTime + AddTime + InvSqrtTime + MultTime * 3)) shiftDY // This is 49+37+11+11 for each of the objects this has to pass around
    (
        .clk(clk),
        .rst(rst),
        .in(dy),
        .out(dy_late)
    ); 

    AddSub subX(
        .clk(clk),
        .areset(rst),
        .a(x1_real),
        .b(x2_real),
        .s(dx)
    );

    AddSub subY(
        .clk(clk),
        .areset(rst),
        .a(y1_real),
        .b(y2_real),
        .s(dy)
    );

    Mult multDX2 (
        .clk(clk),
        .areset(rst),
        .a(dx),
        .b(dx),
        .q(dx2)
    );

    Mult multDY2 (
        .clk(clk),
        .areset(rst),
        .a(dy),
        .b(dy),
        .q(dy2)
    );
    AddSub addD(
        .clk(clk),
        .areset(rst),
        .a(dy2),
        .b(dx2),
        .q(d2)
    );
    InvSqrt invs(
        .clk(clk),
        .areset(rst),
        .a(d2),
        .q(d_inv)
    );

    shift_register #(.SHIFTS(MultTime)) shiftDInv (
        .clk(clk),
        .rst(rst),
        .in(d_inv),
        .out(d_inv_late)
    );

    Mult multinvD2 (
        .clk(clk),
        .areset(rst),
        .a(d_inv),
        .b(d_inv),
        .q(d_inv_2)
    );

    Mult multinvD3 (
        .clk(clk),
        .areset(rst),
        .a(d_inv_2),
        .b(d_inv_late),
        .q(d_inv_3)
    );

    Mult multF (
        .clk(clk),
        .areset(rst),
        .a(m_late),
        .b(d_inv_3),
        .q(f_val)
    );

    Mult multAX (
        .clk(clk),
        .areset(rst),
        .a(f_val),
        .b(dx_late),
        .q(ax)
    );

    Mult multAY (
        .clk(clk),
        .areset(rst),
        .a(f_val),
        .b(dy_late),
        .q(ay)
    );


endmodule
