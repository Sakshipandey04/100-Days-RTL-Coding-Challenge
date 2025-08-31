`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2025 20:27:27
// Design Name: 
// Module Name: JK_to_T_ff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module JK_to_T_ff(
       input wire T, clk, rst,
       output reg Q
    );
    
    assign J= T;
    assign K= T;
    
    always@(posedge clk or posedge rst)begin
      if(rst)
          Q <= 1'b0;
      else begin
        case({J, K})
           2'b00: Q <=Q;
           2'b01: Q <= 1'b0;
           2'b10: Q <=1'b1;
           2'b11: Q <= ~Q;
        endcase
     end
  end
endmodule
