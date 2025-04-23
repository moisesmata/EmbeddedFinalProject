// This module is the wrapper for the entire system. It will take in values from the bus
// write to its memories, and call getaccl and leapfrog

module getAll #(
    BODIES = 512;
    DATA_WIDTH = 64;
    ADDR_WIDTH = 16;
)(
    input logic clk,
    input logic rst,
    input logic [DATA_WIDTH-1:0] write_data,
    input logic read,
    input logic write,
    input logic [ADDR_WIDTH-1:0] addr,
    input logic chipselect,
    output logic read_data
)