`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2025 19:29:47
// Design Name: 
// Module Name: tb_sr_ff
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


module tb_sr_ff;
   reg S,R;
   reg clk;
   wire Q;
   
    sr_ff uut(
    .S(S),
    .R(R),
    .clk(clk),
    .Q(Q)
    );
    initial begin
       clk =0;
       forever #5 clk=~clk;
    end
    initial begin
    $monitor("Time=%0t | clk=%b | S=%b | R=%b | Q=%b", $time, clk, S, R, Q);
      S=0; R=0; #10; // Hold
      S=0; R=1; #10; //Reset
      S=1; R=0; #10; //Set
      S=1; R=1; #10; //invalid
      $finish;
    end
      
endmodule
