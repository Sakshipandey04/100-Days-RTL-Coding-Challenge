`timescale 1ns / 1ps 
// Create Date: 18.09.2025 20:36:10
// Module Name: SIPO_register


module SIPO_register #(parameter N=4)(
     input wire clk,
     input wire rst,
     input wire serial_in,
     output reg[N-1:0] parallel_out
    );
  always @(posedge clk or posedge rst)begin
      if(rst)
         parallel_out <= 0;
      else
         parallel_out <= {parallel_out[N-2:0], serial_in};
      end
    
endmodule
