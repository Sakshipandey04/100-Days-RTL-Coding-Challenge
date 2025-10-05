`timescale 1ns / 1ps
module tb_ROM_module();
    reg clk, rst, start;
    wire [7:0] instr_out;
    wire done;

    // Instantiate DUT
    ROM_module dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .instr_out(instr_out),
        .done(done)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        rst = 1; start = 0;
        #10 rst = 0;
        #20 start = 1;
        #10 start = 0;
        #500 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | PC Instruction=%h | done=%b", $time, instr_out, done);
    end

endmodule
