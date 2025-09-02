`timescale 1ns / 1ps

// Create Date: 02.09.2025 16:07:56
// Module Name: tb_D_to_SR_ff


module tb_D_to_SR_ff;
     reg S, R, rst, clk;
     wire Q;
     
     D_to_SR_ff uut(
     .S(S),
     .R(R),
     .clk(clk),
     .rst(rst),
     .Q(Q)
     );
   initial begin
      clk =0;
      forever #5 clk= ~clk;
    end
    
    initial begin     
     rst =1; S=0; R=0;
     #12 rst=0;
     #10 S=0; R=0; 
     #10 S=1; R=0;
     #10 S=0; R=1;
     #10 S=1; R=1;
     #10 S=0; R=0;
     #10 $stop;
    end
       
       
endmodule
