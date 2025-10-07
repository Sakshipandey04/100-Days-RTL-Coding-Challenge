`timescale 1ns / 1ps
// 8x8 Register File with 2 read ports and 1 write port
// Synchronous write, asynchronous read
module register_file(
    input  wire       clk,
    input  wire       rst,       // synchronous active-high reset
    input  wire       we,        // write enable
    input  wire [2:0] waddr,     // write address (0-7)
    input  wire [2:0] raddr1,    // read port 1 address
    input  wire [2:0] raddr2,    // read port 2 address
    input  wire [7:0] wdata,     // write data
    output wire [7:0] rdata1,    // read data port 1
    output wire [7:0] rdata2     // read data port 2
);

    // 8 registers of 8-bit each
    reg [7:0] regfile [0:7];

    integer i;

    // Synchronous reset
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 8; i = i + 1)
                regfile[i] <= 8'b0;
        end else begin
            if (we)
                regfile[waddr] <= wdata;
        end
    end

    // Asynchronous read
    assign rdata1 = regfile[raddr1];
    assign rdata2 = regfile[raddr2];

endmodule

  