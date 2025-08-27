`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2025 21:06:31
// Design Name: JK_master_slave Flipflop
// Module Name: tb_jk_ms_ff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created



module tb_jk_ms_ff;
   reg J, K , clk, rst;
   wire  Q, Qn;
   
   jk_ms_ff uut(
   .J(J),
   .K(K),
   .clk(clk),
   .rst(rst),
   .Q(Q),
   .Qn(Qn)
   );
   initial begin
      clk=1'b0;
      forever #5 clk=~clk;// toggle every 5ns
    end
    
    initial begin
       $monitor("Time= %0t | clk=%b J=%b K=%b rst=%b | Q= %b Qn= %b", $time, clk, J, K, rst, Q, Qn);
            rst=1; J=0; K=0; //apply reset
            #15 rst=0;//release reset after some time
            #10 J=1; K=0; //set
            #20 J=0; K=1;  //reset
            #20 J=1; K=1; //toggle
            #20 J=0; K=0; //hold
            
            #40 $finish;
        end
     
endmodule
