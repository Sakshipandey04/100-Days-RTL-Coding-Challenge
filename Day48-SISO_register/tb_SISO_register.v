`timescale 1ns / 1ps

// Create Date: 16.09.2025 21:23:45
// Module Name: tb_SISO_register

module tb_SISO_register();
 
 reg clk, rst, serial_in;
 wire serial_out;
 
 SISO_register #(4) uut( .clk(clk), .rst(rst), .serial_in(serial_in), .serial_out(serial_out));
 
 initial clk=0;
 always #5 clk= ~clk;
 
 initial begin 
     rst=1;  serial_in=0; 
     #10; rst=0;
     #10 serial_in=1;
     #10 serial_in=0;
     #10 serial_in= 1;
     #10 serial_in=1;
     #20 serial_in=0;
     
     #10 rst=1;
     #10 rst=0;
     
     #10 serial_in=1;
     #10 serial_in=1;
     #10 serial_in=0;
     #10 serial_in=0;
     #50;
     
     $finish;
  end
  
   
endmodule
