`timescale 1ns / 1ps

module mini_datapath #(
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] reg_data,
    input  [WIDTH-1:0] immediate_data,
    input  [2:0] alu_sel,
    input  mux_sel,
    input  [WIDTH-1:0] alu_in_a,
    output [WIDTH-1:0] result,
    output carry_out
);

    // MUX to select ALU operand B
    wire [WIDTH-1:0] alu_in_b;
    assign alu_in_b = (mux_sel) ? immediate_data : reg_data;

    // ALU instance
    alu #(WIDTH) UALU (
        .A(alu_in_a),
        .B(alu_in_b),
        .ALU_Sel(alu_sel),
        .ALU_Out(result),
        .CarryOut(carry_out)
    );

endmodule

