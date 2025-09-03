`timescale 1ns / 1ps

// Create Date: 03.09.2025 22:02:34
// Module Name: D_to_JK_ff

module D_to_JK_ff(
    input D, clk, reset,
    output reg Q
);
    wire J, K;

    // JK derived from D and Q
    assign J = D & ~Q;
    assign K = ~D & Q;

    // JK Flip-Flop behavior
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else begin
            case ({J, K})
                2'b00: Q <= Q;      // No change
                2'b01: Q <= 0;      // Reset
                2'b10: Q <= 1;      // Set
                2'b11: Q <= ~Q;     // Toggle
            endcase
        end
    end
endmodule
