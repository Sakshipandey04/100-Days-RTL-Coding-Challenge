`timescale 1ns / 1ps

// Create Date: 23.09.2025 13:22:26
// Module Name: USR_tb


module USR_tb();
     parameter N=8;
    reg clk, rst;
    reg [1:0] mode;
    reg [N-1:0] p_data;
    reg sin_left, sin_right;
    wire [N-1:0] Q;
    
    USR #(N)uut(
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .p_data(p_data),
    .sin_left(sin_left),
    .sin_right(sin_right),
    .Q(Q)
    );
    
    always #5 clk=~clk;
    
    initial begin
       clk=0;
       rst=1;
       mode = 2'b00;
       p_data = 8'b00000000;
       sin_left=0;
       sin_right= 0;
       
       #10 rst=0;
       #10 mode= 2'b11; p_data = 8'b10110011;
       #10 mode = 2'b00; //hold
       
       #10 mode = 2'b01; sin_left=1;
       #10 mode= 2'b00; 
       
       #10 mode = 2'b10; sin_right =0;
       #40 mode = 2'b00;
       #20 $finish;
      end
    
       
    
endmodule
