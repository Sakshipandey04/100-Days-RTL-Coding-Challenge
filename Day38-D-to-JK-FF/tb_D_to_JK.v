`timescale 1ns / 1ps
// Create Date: 03.09.2025 22:02:58
 
// Module Name: tb_D_to_JK

module tb_D_to_JK;
    reg D, clk, reset;
    wire Q;

    // Instantiate the DUT
    D_to_JK_ff uut (.D(D), .clk(clk), .reset(reset), .Q(Q));

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    initial begin
        $monitor("Time=%0t | D=%b | Q=%b", $time, D, Q);

        // Initialize
        reset = 1; D = 0;
        #10 reset = 0;

        // Apply test cases
        #10 D=0; // Expect Q=0 (hold or reset)
        #10 D=1; // Q should follow D
        #10 D=0; // Q should follow D
        #10 D=1; // Q should follow D again
        #10 D=0; // Q should reset

        #20 $finish;
    end
endmodule


