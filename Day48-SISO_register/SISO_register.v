`timescale 1ns / 1ps
 // Create Date: 16.09.2025 21:23:14
// Module Name: SISO_register


module SISO_register #(parameter N=4)(
    input wire clk,
    input wire rst,
    input wire serial_in,
    output wire serial_out
    );
      reg [N-1:0] shift_reg;
      
    always@(posedge clk or posedge rst)begin
        if(rst)
           shift_reg <= 0;
        else
           shift_reg <= {shift_reg[N-2:0], serial_in}; //shift left
            
        end
      assign serial_out = shift_reg[N-1];
endmodule
