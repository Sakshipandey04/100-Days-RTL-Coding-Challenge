`timescale 1ns / 1ps


module n_bit_alu #(parameter WIDTH =8)(
    input [WIDTH-1:0] A, B,
    input [2:0] ALU_sel,
    output reg [WIDTH-1:0] ALU_out,
    output reg CarryOut
    );
    always @(*)begin
       CarryOut=0;
       case(ALU_sel)
          3'b000: {CarryOut, ALU_out} = A+B;
          3'b001: {CarryOut, ALU_out} = A-B;
          3'b010: {ALU_out} = A & B;
          3'b011: {ALU_out} = A | B;
          3'b100: {ALU_out} = A ^ B;
          3'b101: {ALU_out} = A << 1;
          3'b110: {ALU_out} = A >>1;
          3'b111: {ALU_out} = ~A;
          default: ALU_out= 0;
          endcase 
       end
endmodule
