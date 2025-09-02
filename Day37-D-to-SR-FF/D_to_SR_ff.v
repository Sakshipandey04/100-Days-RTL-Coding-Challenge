`timescale 1ns / 1ps
// Module Name: D_to_SR_ff

module D_to_SR_ff(
     input wire S,
     input wire R,
     input wire clk,
     input wire rst,
     output reg Q
    
    );
    
    wire D;
    assign D = S | (~R & Q);
  
    always@(posedge clk or posedge rst)begin
       if(rst)
          Q <=1'b0;
       else
         Q <= D;
    end
  
endmodule
