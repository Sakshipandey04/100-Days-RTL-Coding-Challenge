`timescale 1ns / 1ps

// Create Date: 29.08.2025 20:48:52

// Module Name: JK_to_SR_ff


module JK_to_SR_ff(
    input S, R, clk, rst,
    output reg Q, Qbar
    );
    always@(posedge clk or posedge rst)begin
          if(rst)begin
             Q <= 0;
             Qbar <= 1;
          end 
          else begin
             case({S,R})
                2'b00: begin
                   Q <= Q; //no change
                   Qbar <= Qbar;    
                end
               2'b01: begin
                   Q <= 0; //reset
                   Qbar <=1;
               end
               2'b10: begin
                  Q <= 1; //set
                  Qbar <= 0;
               end
               2'b11: begin
                  Q <= ~Q;//toggle
                  Qbar <= ~Qbar;
               end
            endcase 
         end
      end
endmodule
