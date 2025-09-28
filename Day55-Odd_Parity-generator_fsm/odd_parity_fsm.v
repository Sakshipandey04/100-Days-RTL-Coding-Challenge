`timescale 1ns / 1ps

module odd_parity_fsm(
     input wire clk,
     input wire rst,
     input wire load,
     input wire valid,
     input wire din,
     output reg parity
    );
    
    always @(posedge clk)begin
        if(!rst)begin
            parity <= 1'b0;
         end else if(load) begin
            parity <= 1'b0;
         end else if (valid)begin
            parity <= parity ^ din;
        end
    end
endmodule
