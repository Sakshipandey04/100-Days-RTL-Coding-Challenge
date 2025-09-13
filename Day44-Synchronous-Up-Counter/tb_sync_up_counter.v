`timescale 1ns / 1ps

// Create Date: 13.09.2025 20:36:46
// Module Name: tb_sync_up_counter

module tb_sync_up_counter();
   reg clk, rst;
   wire [3:0] Q;
   
   sync_up_counter dut(
     .clk(clk),
     .rst(rst),
     .Q(Q)
     );
     
     initial clk=0;
     always #5 clk=~clk;
     
     initial begin
       $monitor("Time=%t | rst=%b | counter=%b (%0d)", $time, rst, Q, Q);
       rst=1; #10;
       rst=0;
       #200;
       rst=1; #10; 
       rst=0;
       #100;
       $finish;
    end
endmodule
