`timescale 1ns / 1ps

// Create Date: 03.09.2025 22:27:52
// Module Name: D_to_T_ff


module D_to_T_ff(
    input T, clk, reset,
    output reg Q
);
    wire D;

    // Conversion: D = T ⊕ Q
    assign D = T ^ Q;

    // D Flip-Flop implementation
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else
            Q <= D;
    end
endmodule

