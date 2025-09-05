`timescale 1ns / 1ps

// Create Date: 05.09.2025 19:47:40

// Module Name: tb_T_JK_ff

module tb_T_JK_ff;
    reg clk;
    reg T;
    wire Q;

    // Instantiate module
    T_to_JK_ff uut (
        .clk(clk),
        .T(T),
        .Q(Q)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        // Initialize
        T = 0; #10;

        // Toggle
        T = 1; #10;
        T = 0; #10;
        T = 1; #10;
        T = 1; #10;
        T = 0; #10;

        $stop; // End simulation
    end


endmodule
