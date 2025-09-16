`timescale 1ns / 1ps

// Create Date: 15.09.2025 08:21:10

// Module Name: Johnson_counter

module Johnson_counter(
      input clk,
      input rst,
      output reg [3:0] Q
    );
    
    always @(posedge clk)begin
       if(rst)
          Q <= 4'b0000;
       else 
           Q <= {~Q[0], Q[3:1]};
           
   end  
     
endmodule
