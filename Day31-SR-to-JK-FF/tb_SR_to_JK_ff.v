`timescale 1ns / 1ps

// Create Date: 28.08.2025 20:16:12
// Design Name: 
// Module Name: tb_SR_to_JK_ff
//


module tb_SR_to_JK_ff;
       reg J, K, clk, rst;
       wire Q;
       
       SR_to_JK_ff uut(
           .J(J),
           .K(K),
           .clk(clk),
           .rst(rst),
           .Q(Q)
           );
           
       initial begin
          clk=0;
          forever #5 clk= ~clk;
       end
       
       initial begin
            rst =1; J=0; K=0;
            #10 rst=0;
            
            #10 J=0; K=0;
            #10 J=1; K=0;
            #10 J=0; K=1;
            #10 J=1; K=1;
            #10 J=0; K=0;
            #50 $stop;
       end
     
    
            
endmodule
