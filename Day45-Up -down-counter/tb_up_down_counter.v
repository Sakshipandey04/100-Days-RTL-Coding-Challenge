`timescale 1ns / 1ps
// Create Date: 14.09.2025 19:18:07
// Module Name: tb_up_down_counter
module tb_up_down_counter();
      reg clk, rst, up_down;
      wire [3:0] Q;
      
    up_down_counter uut(
    .clk(clk),
    .rst(rst),
    .up_down(up_down),
    .Q(Q)
    ); 
    
    initial clk=0;
    always #5 clk = ~clk;
    
    initial begin
       $monitor("Time=%0t | Reset=%b | Up_down=%b | Counter=%b |(%0d)", $time, rst, up_down, Q, Q);
     
     
     rst=1; up_down=1; #10;
     rst=0;
     up_down =1;
     #160;
     up_down=0;
     #160;
     rst=1; #10;
     rst=0;
     up_down=1;
     #80;
     
     $finish;
   end
     
endmodule
