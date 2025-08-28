`timescale 1ns / 1ps

// Create Date: 28.08.2025 22:08:50
// Design Name: 
// Module Name: tb_SR_to_T_ff


module tb_SR_to_T_ff;
    reg T, clk, reset;
    wire Q;

    SR_to_T_ff uut (.T(T), .clk(clk), .reset(reset), .Q(Q));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time unit clock period
    end

    initial begin
        // Initialize
        reset = 1; T = 0;
        #10 reset = 0;

        // Test sequence
        #10 T = 0;  // Hold
        #10 T = 1;  // Toggle
        #10 T = 1;  // Toggle again
        #10 T = 0;  // Hold
        #10 T = 1;  // Toggle
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | T=%b | Q=%b", $time, T, Q);
    end


endmodule
