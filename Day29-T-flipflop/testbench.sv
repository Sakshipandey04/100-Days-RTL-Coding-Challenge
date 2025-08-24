`timescale 1ns / 1ps

module tb_T_flipflop;
    reg clk;
    reg reset;
    reg T;
    wire Q;


    T_flipflop dut (.clk(clk), .reset(reset), .T(T), .Q(Q));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | T=%b | Q=%b",
                  $time, clk, reset, T, Q);

        $dumpfile("T_flipflop.vcd");
        $dumpvars(0, tb_T_flipflop);
      
        reset = 1; T = 0;
        #10 reset = 0;
      
        #10 T = 0;
        #20 T = 1;
        #30 T = 1;
        #20 T = 0;

        #20 reset = 1;
        #10 reset = 0; T = 1;

        #50 $finish;
    end
endmodule
