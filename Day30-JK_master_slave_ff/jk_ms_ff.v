`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2025 21:06:11
// Design Name: 
// Module Name: jk_ms_ff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module jk_ms_ff(
   input wire J,
   input wire K,
   input wire clk,
   input wire rst,
   output reg Q,
   output reg Qn
   
    );
    
    reg master; //master stage
    
    always@(posedge clk or  posedge rst)begin
        if(rst)
            master <= 1'b0; // reset clears master
         else begin
            case({J, K})
              2'b00: master <= master; //hold state
              2'b01: master <= 1'b0;  //reset
              2'b10: master <=1'b1;   //set
              2'b11: master <= ~master; //toggle
            endcase
        end
     end
     
     always@(negedge clk or posedge rst)begin
         if(rst)begin
           Q <=1'b0; //reset clears Q
           Qn <=1'b1;  //Qn = complement
         end else begin
           Q <= master; // slave follows master
           Qn <= ~master ;
         end
      end
endmodule
