`timescale 1ns / 1ps


module peripheral(
    input  wire clk,
    input  wire rst,
    input  wire wr_en,
    input  wire rd_en,
    input  wire [1:0] addr,
    input  wire [3:0] wdata,
    output reg  [3:0] rdata
);
    reg [3:0] reg_bank [3:0];

    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 4; i = i + 1)
                reg_bank[i] <= 4'b0000;
            rdata <= 4'b0000; // ✅ Initialize
        end else begin
            if (wr_en)
                reg_bank[addr] <= wdata;
            if (rd_en)
                rdata <= reg_bank[addr];
            else
                rdata <= 4'b0000; // ✅ Drive defined value
        end
    end
endmodule

