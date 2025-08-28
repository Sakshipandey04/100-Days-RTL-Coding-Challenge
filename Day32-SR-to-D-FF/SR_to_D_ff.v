`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2025 21:40:42
// Design Name: 
// Module Name: SR_to_D_ff



module SR_to_D_ff(
   input D, clk, rst,
   output reg Q
    );
    wire S,R;
    assign S= D;
    assign R= ~D;
    
    always@(posedge clk or posedge rst)begin
        if(rst)
           Q <= 1'b0;
        else begin
           case({S,R})
              2'b10: Q <=1'b1; //set
              2'b01: Q <= 1'b0; //reset
              2'b00: Q <= Q; //no change
              2'b11: Q <= 1'bx; //invalid
            endcase
         end
    end
              
           
endmodule
