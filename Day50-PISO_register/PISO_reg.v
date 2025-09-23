`timescale 1ns / 1ps

// Create Date: 18.09.2025 21:24:07

// Module Name: PISO_reg


module PISO_reg #(
parameter N=8 //width of parallel data
)(
      input wire clk,
      input wire rst,
      input  wire load,
      input wire shift_en,
      input wire [N-1:0] p_data,
      output reg s_data
    );
    
    reg [N-1:0] shift_reg;
    
    always @(posedge clk or posedge rst)begin 
       if(rst)begin
          shift_reg <= {N{1'b0}};
          s_data <= 1'b0;
        end else if(load)begin
          shift_reg <=  p_data; //load parallel data into register
        end else if(shift_en)begin
           s_data <= shift_reg[0];
           shift_reg <= shift_reg >> 1; // shift right
        end
      end
      
          
endmodule
