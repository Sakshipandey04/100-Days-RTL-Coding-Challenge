`timescale 1ns / 1ps
`include "alu.v"
`include "reg_file.v"

module cpu_datapath #(
    parameter WIDTH = 8,
    parameter REG_COUNT = 8
)(
    input wire clk, rst,
    input wire write_en,
    input wire [$clog2(REG_COUNT)-1:0] write_addr,
    input wire [WIDTH-1:0] immediate_data,
    input wire [2:0] alu_sel,
    input wire mux_sel, // 0: reg_data2, 1: immediate_data
    input wire [$clog2(REG_COUNT)-1:0] read_addr1,
    input wire [$clog2(REG_COUNT)-1:0] read_addr2,
    output wire [WIDTH-1:0] alu_result,
    output wire carry_out
);

    wire [WIDTH-1:0] reg_data1, reg_data2;
    wire [WIDTH-1:0] alu_operand_b;

    // Register file instance
    reg_file #(WIDTH, REG_COUNT) RF (
        .clk(clk), .rst(rst),
        .write_en(write_en),
        .write_addr(write_addr),
        .write_data(alu_result),
        .read_addr1(read_addr1),
        .read_addr2(read_addr2),
        .read_data1(reg_data1),
        .read_data2(reg_data2)
    );

    // MUX to select operand B
    assign alu_operand_b = (mux_sel) ? immediate_data : reg_data2;

    // ALU instance
    alu #(WIDTH) ALU_INST (
        .A(reg_data1),
        .B(alu_operand_b),
        .ALU_Sel(alu_sel),
        .ALU_Out(alu_result),
        .CarryOut(carry_out)
    );

endmodule

