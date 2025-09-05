`timescale 1ns / 1ps

// Create Date: 05.09.2025 19:47:12
// Module Name: T_to_JK_ff

module T_to_JK_ff(

    input clk,
    input T,
    output reg Q
);

    wire J, K;

    // Conversion logic: T -> JK
    assign J = T;
    assign K = T;

    // JK Flip-Flop behavior
    always @(posedge clk) begin
        case ({J, K})
            2'b00: Q <= Q;       // Hold
            2'b01: Q <= 0;       // Reset
            2'b10: Q <= 1;       // Set
            2'b11: Q <= ~Q;      // Toggle
        endcase
    end

    // Initialize Q
    initial Q = 0;


endmodule
