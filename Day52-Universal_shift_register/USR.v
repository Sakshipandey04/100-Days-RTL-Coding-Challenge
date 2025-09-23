`timescale 1ns / 1ps
 
// Create Date: 23.09.2025 13:22:09

// Module Name: USR

module USR #(parameter N=8)(
    input wire clk,
    input wire rst,
    input wire [1:0] mode,
    input wire [N-1:0] p_data,
    input wire sin_left,
    input wire sin_right,
    output reg [N-1:0] Q
    );
    
    always@(posedge clk or posedge rst)begin
        if(rst) 
          Q <= {N{1'b0}};
        else begin
          case(mode)
              2'b00: Q <= Q; //hold
              2'b01: Q <= {sin_left, Q[N-1:1]};// shift right
              2'b10: Q <= {Q[N-2:0], sin_right}; //shift left
              2'b11: Q <= p_data;  //parallel load
         endcase
     end
   end 
              
         
endmodule
