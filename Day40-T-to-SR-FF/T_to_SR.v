`timescale 1ns / 1ps
 
// Create Date: 05.09.2025 19:06:05

// Module Name: T_to_SR


module T_to_SR(
   input clk,
   input S,
   input R,
   output reg Q
    );
    
    wire T;
    assign T=  S ^ R;
    always @(posedge clk)begin
        if(S & R)
           Q <=  Q; 
        else if(T)
           Q <= ~Q; //toggle
        else 
           Q <= Q; //hold
        end
           
       initial Q=0;     
           
endmodule
