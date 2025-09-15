`timescale 1ns / 1ps
// Create Date: 14.09.2025 19:17:44
// Module Name: up_down_counter
module up_down_counter(
    input clk,
    input rst,
    input up_down,
    output reg [3:0] Q
    );
    
    always@(posedge clk)begin
          if(rst)
             Q <= 4'b0000;
          else if(up_down)
             Q <= Q +1;
          else 
             Q <= Q-1;
     end
endmodule
