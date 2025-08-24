`timescale 1ns / 1ps

module tb_D_flipflop;

    reg D;
    reg clk;
    reg reset;
    wire Q;


    D_flipflop dut (
        .D(D),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

 
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   
    end

    initial begin
        $monitor("T=%0t | clk=%b | D=%b | reset=%b | Q=%b", 
                  $time, clk, D, reset, Q);
      $dumpfile("D_flipflop.vcd");
        $dumpvars(0, tb_D_flipflop);

        D = 0; reset = 1;
        #10 reset = 0;   

        #5  D = 1;
        #10 D = 0;
        #10 D = 1;
        #20 reset = 1;   
        #10 reset = 0; D = 0;
        #50 $finish;
    end

endmodule
