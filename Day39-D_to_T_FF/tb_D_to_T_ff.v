`timescale 1ns / 1ps

// Create Date: 03.09.2025 22:28:19

// Module Name: tb_D_to_T_ff

module tb_D_to_T_ff;

    reg T, clk, reset;
    wire Q;

    // Instantiate DUT
    D_to_T_ff uut (.T(T), .clk(clk), .reset(reset), .Q(Q));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    initial begin
        $monitor("Time=%0t | T=%b | Q=%b", $time, T, Q);

        // Initialize
        reset = 1; T = 0;
        #10 reset = 0;

        // Apply test cases
        #10 T = 0; // Hold
        #10 T = 1; // Toggle
        #10 T = 1; // Toggle again
        #10 T = 0; // Hold
        #10 T = 1; // Toggle

        #20 $finish;
    end
endmodule

