`timescale 1ns / 1ps

module T_flipflop(
    input  wire clk,
    input  wire reset,   
    input  wire T,
    output reg  Q
    );

    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;         
        else if (T)
            Q <= ~Q;         
        else
            Q <= Q;          
    end
endmodule
