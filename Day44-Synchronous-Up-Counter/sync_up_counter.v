`timescale 1ns / 1ps
// Create Date: 13.09.2025 20:36:28

// Module Name: sync_up_counter



module sync_up_counter(
     input clk,
     input rst,
     output reg [3:0] Q
    );
    always @(posedge clk) begin
       if(rst)
          Q <= 4'b0000;
       else 
       Q <= Q + 1;
   end
endmodule
