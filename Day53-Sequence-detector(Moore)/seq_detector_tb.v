`timescale 1ns / 1ps

 
// Create Date: 23.09.2025 17:07:00

// Module Name: seq_detector_tb

module seq_detector_tb();
         reg clk, rst;
         reg x;
         wire y;
         
         
         seq_detector dut(
         .clk(clk),
         .rst(rst),
         .x(x),
         .y(y)
         );
         
         always #5 clk=~clk;
         initial begin
           clk=0;
           rst=0;
           x=0;
           #10 rst=0;
           //input sequence 1011011
           #10 x=1; //'1'
           #10 x=0; //'10'
           #10 x=1; //'101'
           #10 x=1; //'1011' (y='1')
           #10 x=0; //'0'
           #10 x=1; //'1'
           #10 x=1; //'1101' again y=1
           #20;
           $finish;
           end
         
endmodule
