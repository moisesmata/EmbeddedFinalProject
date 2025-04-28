module circular_buffer #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 16
)(
    input  logic                  clk,
    input  logic                  reset,

    // Write interface
    input  logic                  wr_en,
    input  logic [DATA_WIDTH-1:0] wr_data,
    output logic                  full,

    // Read interface
    input  logic                  rd_en,
    output logic [DATA_WIDTH-1:0] rd_data,
    output logic                  empty
);

    // Address pointers
    logic [$clog2(DEPTH)-1:0] wr_ptr;
    logic [$clog2(DEPTH)-1:0] rd_ptr;

    // Buffer memory
    logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Status flags
    logic [$clog2(DEPTH+1)-1:0] count;

    // Write logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            wr_ptr <= 0;
        end else if (wr_en && !full) begin
            mem[wr_ptr] <= wr_data;
            wr_ptr <= (wr_ptr + 1) % DEPTH;
        end
    end

    // Read logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            rd_ptr <= 0;
        end else if (rd_en && !empty) begin
            rd_ptr <= (rd_ptr + 1) % DEPTH;
        end
    end

    // Output logic
    assign rd_data = mem[rd_ptr];

    // Count logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
        end else begin
            case ({wr_en && !full, rd_en && !empty})
                2'b10: count <= count + 1; // Write only
                2'b01: count <= count - 1; // Read only
                default: count <= count;   // No change or simultaneous read/write
            endcase
        end
    end

    // Status flags
    assign full  = (count == DEPTH);
    assign empty = (count == 0);

endmodule
