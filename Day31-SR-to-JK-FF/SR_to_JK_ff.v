`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2025 20:15:49
// Design Name: 
// Module Name: SR_to_JK_ff

module SR_to_JK_ff(
input wire J, K, clk, rst,
output reg Q
    );
    wire S, R;
    //Conversion Equation
    assign S= J & ~Q;
    assign R=  K & Q;
    
    always@(posedge  clk or posedge rst)begin
          if(rst)begin
             Q <= 1'b0;
          end
         else begin
            case({S,R})
                2'b10: Q <= 1'b1; //set
                2'b01: Q <= 1'b0; //reset
                2'b00: Q <= Q;  //hold
                2'b11: Q <= 1'bx; //Invalid for SR FF
            endcase 
         end
    end
                
                
endmodule
