`timescale 1ns / 1ps

// Create Date: 28.08.2025 22:08:25
// Design Name: 
// Module Name: SR_to_T_ff


module SR_to_T_ff(
    input T,
    input clk,
    input reset,   // async reset
    output reg Q

    );
   

    wire S, R;

    // Mapping logic: S = T * Q', R = T * Q
    assign S = T & ~Q;
    assign R = T & Q;

    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else begin
            case ({S, R})
                2'b10: Q <= 1'b1;   // Set
                2'b01: Q <= 1'b0;   // Reset
                2'b00: Q <= Q;      // Hold
                2'b11: Q <= 1'bx;   // Invalid (not possible here)
            endcase
        end
    end


endmodule
