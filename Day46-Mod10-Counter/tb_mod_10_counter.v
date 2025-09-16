`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2025 08:05:33
// Design Name: 
// Module Name: tb_mod_10_counter

module tb_mod_10_counter();
      reg clk, rst;
      wire [3:0] Q;
      
      mod_10_counter uut(
         .clk(clk),
         .rst(rst),
         .Q(Q)
         );
      initial clk=0;
      always #5 clk=~clk;
      initial begin
          rst=1; #10;
          rst=0;
          #250;
          rst=1; #10;
          rst=0;
          #100;
          $finish;
      end
endmodule
