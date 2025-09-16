`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2025 08:04:59
// Design Name: 
// Module Name: mod_10_counter
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


module mod_10_counter  #(
    parameter N=10
   )(
   input clk,
   input rst,
   output reg[$clog2(N)-1:0] Q
  
   );
   always @(posedge clk)begin
       if(rst)
           Q <= 0;
        else if(Q == N-1)
            Q <= 0;
         else
             Q <= Q + 1;
    end   
     
endmodule
