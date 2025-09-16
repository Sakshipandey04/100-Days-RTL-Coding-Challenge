`timescale 1ns / 1ps

// Create Date: 15.09.2025 08:22:52
// Design Name: 
// Module Name: tb_johnson_counter


module tb_johnson_counter();
       reg clk, rst;
       wire [3:0] Q;
        
        
     Johnson_counter uut(
        .clk(clk),
        .rst(rst),
        .Q(Q)
        
        );
        
        initial clk=0;
        always #5 clk=~clk;
        
        initial begin
          rst=1; #10;
          rst=0;
          #120;
          rst=1; #10;
          rst=0;
          #60;
          $finish;
       end
          
endmodule
