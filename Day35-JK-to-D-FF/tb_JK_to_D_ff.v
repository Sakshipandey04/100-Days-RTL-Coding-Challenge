`timescale 1ns / 1ps

// Create Date: 30.08.2025 20:15:19
// Module Name: tb_JK_to_D_ff

module tb_JK_to_D_ff;
    reg J, K, clk, rst;
    wire Q;
    
    JK_to_D_ff uut(
    .J(J),
    .K(K),
    .clk(clk),
    .rst(rst),
    .Q(Q)
    );
    initial begin
       clk=0;
       forever #5 clk= ~clk;
    end
    
    initial begin
       $dumpfile("JK_to_D_ff.vcd");
       $dumpvars(0, tb_JK_to_D_ff);
       
       rst=1; J=0; K=0;
       #10 rst=0;
       
       #10 J=0; K=0;
       #10 J=0; K=1;
       #10 J=1; K=0;
       #10 J=1; K=1;
       #50 $finish;
    end
endmodule
