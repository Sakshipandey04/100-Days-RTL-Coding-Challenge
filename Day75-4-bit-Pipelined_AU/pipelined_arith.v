`timescale 1ns / 1ps


module pipelined_arith(
    input  wire clk,
    input  wire rst,
    input  wire [7:0] a, b,
    input  wire op_sel,         // 0 = Add, 1 = Multiply
    output reg  [15:0] result
);
    // Stage registers
    reg [7:0] a_s1, b_s1;
    reg op_s1;

    reg [15:0] sum_s2, prod_s2;
    reg op_s2;

    reg [15:0] alu_out_s3;
    reg op_s3;

    // Stage 1: Latch Inputs
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_s1 <= 0; b_s1 <= 0; op_s1 <= 0;
        end else begin
            a_s1 <= a;
            b_s1 <= b;
            op_s1 <= op_sel;
        end
    end

    // Stage 2: Compute partial results
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum_s2 <= 0; prod_s2 <= 0; op_s2 <= 0;
        end else begin
            sum_s2 <= a_s1 + b_s1;
            prod_s2 <= a_s1 * b_s1;
            op_s2 <= op_s1;
        end
    end

    // Stage 3: Select operation result
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            alu_out_s3 <= 0; op_s3 <= 0;
        end else begin
            alu_out_s3 <= (op_s2) ? prod_s2 : sum_s2;
            op_s3 <= op_s2;
        end
    end

    // Stage 4: Output
    always @(posedge clk or posedge rst) begin
        if (rst)
            result <= 0;
        else
            result <= alu_out_s3;
    end
endmodule
