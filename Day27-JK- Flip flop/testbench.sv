`timescale 1ns/1ps

module tb_jk_ff;

    reg clk, rst_n, preset_n, j, k;
    wire q, qn;

    // DUT instantiation
    jk_ff dut (
        .clk(clk),
        .rst_n(rst_n),
        .preset_n(preset_n),
        .j(j),
        .k(k),
        .q(q),
        .qn(qn)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // VCD file for GTKWave
        $dumpfile("jk_ff_tb.vcd");
        $dumpvars(0, tb_jk_ff);

        // Initial values
        clk = 0; j = 0; k = 0;
        rst_n = 0; preset_n = 1;

    
        #10; rst_n = 1; // release reset

        // Test HOLD (J=0, K=0)
        j=0; k=0; #20;

        // Test SET (J=1, K=0)
        j=1; k=0; #20;

        // Test RESET (J=0, K=1)
        j=0; k=1; #20;

        // Test TOGGLE (J=1, K=1)
        j=1; k=1; #40;

        // Test asynchronous PRESET
        preset_n = 0; #10; preset_n = 1; #20;

        // Test asynchronous RESET
        rst_n = 0; #10; rst_n = 1; #20;

        $display("Simulation complete!");
        $finish;
    end

endmodule
