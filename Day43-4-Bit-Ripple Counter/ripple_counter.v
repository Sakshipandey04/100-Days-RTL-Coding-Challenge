`timescale 1ns / 1ps

// Create Date: 10.09.2025 08:23:42
// Module Name: ripple_counter

module ripple_counter(
     input clk,
     input rst,
     output [3:0] Q
    );
    reg[3:0] q_reg;
    
    assign Q = q_reg;
    always@(posedge clk or posedge rst) begin  
      if(rst)
          q_reg[0] <= 0;
      else
          q_reg[0] <= ~q_reg[0];
   end
  genvar i;
  generate
  
     for(i=0; i<4; i= i+1)begin : ripple
     always@(negedge q_reg[1] or posedge rst)
      begin
      
         if(rst)
            q_reg[i] <=0;
         else
            q_reg[i] <= ~q_reg[i];
        end
     end 
  endgenerate    
         
      
    
endmodule
