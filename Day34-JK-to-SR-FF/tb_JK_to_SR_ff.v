`timescale 1ns / 1ps
// Create Date: 29.08.2025 20:49:57
// Design Name: 
// Module Name: tb_JK_to_SR_ff


module tb_JK_to_SR_ff;
   reg S, R, clk, rst;
   wire Q, Qbar;
   
   JK_to_SR_ff uut(
   .S(S), 
   .R(R),
   .clk(clk),
   .rst(rst),
   .Q(Q),
   .Qbar(Qbar)
   );
    initial begin
       clk =0;
       forever #5 clk = ~clk;
    end
    
    initial begin
        rst =1; S=0; R=0; #10;
        rst =0;
        
        S=0; R=0; #10; //hold
        S=0; R=1;  #10; //set
        S=1; R=0; #10; //reset
        S=1; R=1; #10; //toggle
        S=0; R=0; #10; //hold again
        
        $stop;
      end        
endmodule
