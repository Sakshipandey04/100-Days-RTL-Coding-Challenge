`timescale 1ns / 1ps
 
// Module Name: tb_JK_to_T_ff

module tb_JK_to_T_ff;
   reg T, clk, rst;
   wire Q;
   
   JK_to_T_ff uut(
   .T(T),
   .clk(clk),
   .rst(rst),
   .Q(Q)
   );
   
   always #5 clk = ~clk;
   initial begin
     clk=0; rst=1; T=0;
     #10 rst =0;
     #10 T=0;
     #10 T=1;
     #10 T=1;
     #10 T=0;
     #10 T=1;
     
     #50; $finish;
  end
     
endmodule
