`timescale 1ns / 1ps

// Create Date: 18.09.2025 20:39:47

// Module Name: tb_SIPO_register



module tb_SIPO_register();
      reg clk, rst, serial_in;
      wire [3:0] parallel_out;
      
      SIPO_register #(4) uut(
      .clk(clk),
      .rst(rst),
      .serial_in(serial_in),
      .parallel_out(parallel_out)
      );
      initial clk=0;
      always #5 clk=~clk;
      initial begin
          rst=1; serial_in=0;
          #12 rst=0;
          #10 serial_in=1;
          #10 serial_in=0;
          #10 serial_in= 1;
          #10 serial_in=1;
          #30 $finish;
   end
endmodule
