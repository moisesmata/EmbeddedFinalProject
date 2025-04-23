// This module should take in the XYZ of one body, XYZ and M of the second, 
// and output AX, AY, AZ experinced by the first due to the second
// The wrapping program has to ensure that valid data is being fed in, and that it keeps track of what is coming out.
// Latency is <<INPUT THIS>> cycles


module getAccl #(
    parameter MultTime = 11 // Number of cycles for mult
    parameter AddTime = 20 // Number of cycles for add/sub 
    parameter InvSqrtTime = 27 // Number of cycles for invsqert
)(
    input logic rst,          // Reset signal
    input logic clk,          // Clock signal
    input logic [63:0] x1,    // X coordinate of the first body
    input logic [63:0] y1,    // Y coordinate of the first body
    input logic [63:0] z1,    // Z coordinate of the first body
    input logic [63:0] x2,    // X coordinate of the second body
    input logic [63:0] y2,    // Y coordinate of the second body
    input logic [63:0] m2,    // Mass of the second body (premultaplied by G)
    output logic [63:0] ax,   // Acceleration in the X direction
    output logic [63:0] ay,   // Acceleration in the Y direction
);
    logic wire [63:0] m_late, dx, dy, dx2, dy2, dx_late, dy_late, d_inv, d_inv_2, F_val;
    logic wire [63:0] d_inv_late;

    shift_register #(.SHIFTS(AddTime + MultTime + AddTime + InvSqrtTime + MultTime * 2)) shiftM // This is 20+49+37+11+11 for each of the objects this has to pass around
    (
        .clk(clk),
        .rst(rst),
        .in(m2),
        .out(m_late),
    ); 
    shift_register #(.SHIFTS(MultTime + AddTime + InvSqrtTime + MultTime * 3)) shiftDX // This is 49+37+11+11 for each of the objects this has to pass around
    (
        .clk(clk),
        .rst(rst),
        .in(dx),
        .out(dx_late),
    ); 
    shift_register #(.SHIFTS(MultTime + AddTime + InvSqrtTime + MultTime * 3)) shiftDY // This is 49+37+11+11 for each of the objects this has to pass around
    (
        .clk(clk),
        .rst(rst),
        .in(dy),
        .out(dy_late),
    ); 

    AddSub subX(
        .clk(clk),
        .rst(rst),
        .a(x1),
        .b(x2),
        .s(dx)
    );
    AddSub subY(
        .clk(clk),
        .rst(rst),
        .a(y1),
        .b(y2),
        .s(dy)
    );

    Mult multDX2 (
        .clk(clk),
        .rst(rst),
        .a(dx),
        .b(dx),
        .p(dx2)
    );

    Mult multDY2 (
        .clk(clk),
        .rst(rst),
        .a(dy),
        .b(dy),
        .p(dy2)
    );

    InvSqrt invs(
        .clk(clk),
        .rst(rst),
        .a(d2),
        .q(d_inv)
    )

    shift_register #(SHIFTS(MultTime)) shiftDInv (
        .clk(clk),
        .rst(rst),
        .in(d_inv),
        .out(d_inv_late)
    )

    Mult multinvD2 (
        .clk(clk),
        .rst(rst),
        .a(d_inv),
        .b(d_inv),
        .p(d_inv_2)
    );

    Mult multinvD3 (
        .clk(clk),
        .rst(rst),
        .a(d_inv_2),
        .b(d_inv_late),
        .p(d_inv_3)
    );

    Mult multF (
        .clk(clk),
        .rst(rst),
        .a(m_late),
        .b(d_inv_3),
        .p(f)
    );

    Mult multAX (
        .clk(clk),
        .rst(rst),
        .a(f),
        .b(dx_late),
        .p(ax)
    );

    Mult multAY (
        .clk(clk),
        .rst(rst),
        .a(f),
        .b(dy_late),
        .p(ay)
    );

    Mult multAZ (
        .clk(clk),
        .rst(rst),
        .a(f),
        .b(dz_late),
        .p(az)
    );


endmodule