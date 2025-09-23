`timescale 1ns / 1ps
 // Create Date: 23.09.2025 11:56:47

// Module Name: PIPO_reg

module PIPO_reg #(parameter N=8)
    (
    input clk,
    input rst,
    input load,
    input wire [N-1:0] p_data,
    output reg [N-1:0] q
    );
    
    always @(posedge clk or posedge rst)begin
        if(rst)
           q <= {N{1'b0}};
        else if(load) 
          q <= p_data; //store parallel input
      end
            
        
endmodule
