`timescale 1ns / 1ps

module reg_file #(
    parameter DATA_WIDTH = 8,
    parameter REG_COUNT = 8
)(
    input wire clk,
    input wire rst,
    input wire write_en,
    input wire [$clog2(REG_COUNT)-1:0] write_addr,
    input wire [DATA_WIDTH-1:0] write_data,
    input wire [$clog2(REG_COUNT)-1:0] read_addr1,
    input wire [$clog2(REG_COUNT)-1:0] read_addr2,
    output reg [DATA_WIDTH-1:0] read_data1,
    output reg [DATA_WIDTH-1:0] read_data2
);

    reg [DATA_WIDTH-1:0] reg_array [0:REG_COUNT-1];
    integer i;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            for(i = 0; i < REG_COUNT; i=i+1)
                reg_array[i] <= 0;
        end else if(write_en)
            reg_array[write_addr] <= write_data;
    end

    always @(*) begin
        read_data1 = reg_array[read_addr1];
        read_data2 = reg_array[read_addr2];
    end

endmodule