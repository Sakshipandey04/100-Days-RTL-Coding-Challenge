`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2025 21:41:12
// Design Name: 
// Module Name: tb_SR_to_D_ff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_SR_to_D_ff;
    reg D, clk, rst;
    wire Q;

SR_to_D_ff uut(
     .D(D),
     .clk(clk),
     .rst(rst),
     .Q(Q)
     
     );
     initial begin
        clk=0;
        forever #5 clk = ~clk;
     end
     initial begin
        rst= 1; D=0;
        #10 rst =0;
        #10 D=1;
        #10 D=0;
        #10 D= 1;
        #10 D=0;
        #20 $finish;
      end
      
endmodule
