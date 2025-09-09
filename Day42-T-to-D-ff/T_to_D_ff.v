`timescale 1ns / 1ps

// Create Date: 08.09.2025 22:43:54

// Module Name: T_to_D_ff

module T_to_D_ff(
    input D,
    input clk,
    input rst,
    output reg  Q
    );
    
    wire T;
    assign T= D ^Q;
 

   always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;   // T Flip-Flop behavior
        else
            Q <= Q;
    end

endmodule
