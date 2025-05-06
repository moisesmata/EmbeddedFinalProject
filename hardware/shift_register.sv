module shift_register #(
    parameter SHIFTS = 4 // Number of shifts (delay cycles)
)(
    input wire clk,                  // Clock signal
    input wire rst,                  // Reset signal (active high)
    input wire [63:0] in,            // 64-bit input signal
    output wire [63:0] out           // 64-bit output signal
);

    // Internal shift register storage
    reg [63:0] shift_reg [SHIFTS-1:0];

    // Shift register logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            integer i;
            for (i = 0; i < SHIFTS; i = i + 1) begin
                shift_reg[i] <= 64'b0; // Reset all bits to 0
            end
        end else begin
            integer i;
            for (i = SHIFTS-1; i > 0; i = i - 1) begin
                shift_reg[i] <= shift_reg[i-1]; // Shift values
            end
            shift_reg[0] <= in; // Insert new input
        end
    end

    // Output the value from SHIFTS cycles ago
    assign out = shift_reg[SHIFTS-1];

endmodule
