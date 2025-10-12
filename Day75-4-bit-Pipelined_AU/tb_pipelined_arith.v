`timescale 1ns / 1ps

module tb_pipelined_arith();
    reg clk, rst;
    reg [7:0] a, b;
    reg op_sel;
    wire [15:0] result;

    pipelined_arith DUT (.clk(clk), .rst(rst), .a(a), .b(b), .op_sel(op_sel), .result(result));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("pipelined_arith.vcd");
        $dumpvars(0, tb_pipelined_arith);

        rst = 1; a = 0; b = 0; op_sel = 0;
        #20 rst = 0;

        // Additions
        a = 8'd5; b = 8'd3; op_sel = 0; #10;
        a = 8'd10; b = 8'd20; op_sel = 0; #10;

        // Multiplications
        a = 8'd4; b = 8'd6; op_sel = 1; #10;
        a = 8'd3; b = 8'd7; op_sel = 1; #10;

        #100 $finish;
    end

    initial begin
        $monitor("T=%0t | a=%d b=%d op_sel=%b | result=%d",
                 $time, a, b, op_sel, result);
    end

endmodule
