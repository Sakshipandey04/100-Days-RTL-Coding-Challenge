`timescale 1ns / 1ps
module universal_counter #
( parameter WIDTH=8)
(
input wire clk,
input wire rst,
input wire enable,
input wire [1:0] mode,
output reg [WIDTH-1:0] count
    );
    
    reg dir; //direction for up down counting
    always@(posedge clk) begin
        if(rst)begin
           count <=0;
           dir <= 1; //start counting for up-down mode
         end
         else if(enable) begin
            case(mode)
               2'b00: count <= count; //hold
               2'b01: count <= count + 1'b1; //up
               2'b10: count <= count - 1'b1; //down
               2'b11: begin 
                   if(dir)
                      count <= count + 1'b1;
                    else
                    count <= count - 1'b1;
                 end
            endcase
            
         //update direction for up-down
         if(mode== 2'b11) begin
            if(count == {WIDTH{1'b1}})
                  dir <=0; //start counting down
            else if (count==0)
               dir <= 1;//start counting up
            end
        end
    end    
               
               
         
         
endmodule
