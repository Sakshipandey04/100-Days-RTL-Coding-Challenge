`timescale 1ns / 1ps

// Create Date: 08.09.2025 22:44:34
// Design Name: 
// Module Name: tb_T_to_D_ff



module tb_T_to_D_ff();
    reg D;         // D input
    reg clk;       // clock
    reg rst;     // reset
    wire Q;        // output

    // Instantiate the module
    T_to_D_ff uut (
        .D(D),
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );

    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        // Monitor signals
        $monitor("Time=%0t | rst=%b | D=%b | Q=%b", $time, rst, D, Q);

        // Initialize
        rst = 1; D = 0;
        #10 rst = 0;

        // Apply test cases
        #10 D = 0;
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 1;
        #10 D = 0;

        // Finish simulation
        #20 $finish;
    end


endmodule
