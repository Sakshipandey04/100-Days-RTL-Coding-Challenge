`timescale 1ns / 1ps

// Create Date: 30.08.2025 20:14:45
// Module Name: JK_to_D_ff



module JK_to_D_ff(
    input wire J, K, clk, rst,
    output reg Q
    );
    
    wire D;
    assign D= (J & ~Q) | (~K & D); // JK to D conversion
    
    always@(posedge clk or posedge rst)begin
       if(rst)
         Q <= 1'b0;
       else
         Q <= D;  // D ff behavior
    end
  
endmodule
