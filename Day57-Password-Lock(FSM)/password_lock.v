`timescale 1ns / 1ps

// Module Name: password_lock

module password_lock(
     input wire clk,
     input wire rst,
     input wire enter,
     input wire inbit,
     output reg unlock,
     output reg error
    );
    
    localparam P0= 2'd0, P1=2'd1, P2=2'd2, P3=2'd3;
    reg [1:0] state;
    
    always @(posedge clk)begin
        if(!rst)begin
            state <= P0;
            unlock <= 1'b0;
            error <=0;
         end else begin
            unlock <= 1'b0;
            error <= 1'b0;
            if(enter) begin
               case(state)
                 P0 : begin
                      if(inbit == 1'b1)
                         state <= P1;
                     else
                      error <= 1'b1; 
                   end
                 P1: begin
                   if(inbit == 1'b0)
                      state <=P2;
                   else begin
                      state <= P0;
                      error <=1'b1; 
                      end
                   end
                  P2: begin
                   if(inbit == 1'b1)begin
                      state <= P3;
                      unlock <= 1'b1;
                      state <= P0;
                   end
                   else begin 
                      state <= P0; 
                      error <= 1'b1;
                      end
                    end
                    default: state <= P0;
                 endcase
              end
            end
         end
            
endmodule
