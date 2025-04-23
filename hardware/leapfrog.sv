module leapfrog_integration_64 #(
    parameter WIDTH = 64,
    parameter FRACTIONAL = 32
)(
    input  wire                      clk,
    input  wire                      reset,
    input  wire                      enable,
    input  wire signed [WIDTH-1:0]   accel,     // a(t) or a(t+Δt)
    input  wire signed [WIDTH-1:0]   dt,        // Δt
    output reg  signed [WIDTH-1:0]   pos,       // x(t)
    output reg  signed [WIDTH-1:0]   vel        // v(t)
);

    // Calculate Δt / 2 combinationally
    wire signed [WIDTH-1:0] half_dt = dt >>> 1;

    // Saturation function to prevent overflow/underflow
    function signed [WIDTH-1:0] saturate;
        input signed [WIDTH-1:0] val;
        begin
            if (val > $signed({1'b0, {(WIDTH-1){1'b1}}}))
                saturate = $signed({1'b0, {(WIDTH-1){1'b1}}});
            else if (val < $signed({1'b1, {(WIDTH-1){1'b0}}}))
                saturate = $signed({1'b1, {(WIDTH-1){1'b0}}});
            else
                saturate = val;
        end
    endfunction

    reg signed [WIDTH-1:0] vel_half;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pos      <= 0;
            vel      <= 0;
            vel_half <= 0;
        end else if (enable) begin
            // 1. v(t + Δt/2) = v(t) + 0.5 * a(t) * Δt
            vel_half <= vel + ((accel * half_dt) >>> FRACTIONAL);

            // 2. x(t + Δt) = x(t) + v(t + Δt/2) * Δt
            pos <= saturate(pos + ((vel_half * dt) >>> FRACTIONAL));

            // 3. v(t + Δt) = v(t + Δt/2) + 0.5 * a(t+Δt) * Δt
            vel <= vel_half + ((accel * half_dt) >>> FRACTIONAL);
        end
    end

endmodule
