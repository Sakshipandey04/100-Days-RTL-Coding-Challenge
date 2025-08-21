`timescale 1ns/1ps
module tb_t_latch;
  reg T, clk;
  wire Q;
  
  t_latch uut(
    .T(T), .clk(clk), .Q(Q));
  initial begin
    $dumpfile("t_latch.vcd");
    $dumpvars(0, tb_t_latch);
    
    T=0; 
    #12 T=1;
    #20 T=0;
    #15 T=1;
    #25 $stop;
  end
endmodule
