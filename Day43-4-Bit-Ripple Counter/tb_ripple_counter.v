`timescale 1ns / 1ps

// Module Name: tb_ripple_counter

module tb_ripple_counter();
     reg clk, rst;
     wire [3:0] Q;
     
     
     ripple_counter uut(
     .clk(clk),
     .rst(rst),
     .Q(Q)
     );
  initial begin
  
    clk=0;
    forever #5 clk = ~clk;
  end
  
  initial begin
     $monitor("Time=0%t | rst=%b| Q =%b", $time, rst, Q);
     
     rst=1;
     #10;
     rst=0;
     
     #160;
     
     $finish;
  end
endmodule
