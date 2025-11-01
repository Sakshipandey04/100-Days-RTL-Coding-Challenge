`timescale 1ns / 1ps


module UART_tx(
    input wire clk,
    input wire rst,
    input wire tx_start,
    input wire [7:0] data_in,
    output reg tx_serial,
    output reg tx_busy
    );
    
    parameter BAUD_TICK_COUNT =16; 
    reg [3:0] baud_cnt=0;
    reg [3:0] bit_index=0;
    reg [9:0] tx_shift=10'b1111111111;
    reg baud_tick=0;
    
    always@(posedge clk or posedge rst)begin
         if(rst) begin
             baud_cnt <=0;
             baud_tick <=0;
         end else begin
           if(baud_cnt == BAUD_TICK_COUNT -1) begin
              baud_cnt <=0;
              baud_tick <=1;
           end else begin
              baud_cnt <= baud_cnt +1;
              baud_tick <=0;
           end
         end
     end
     
     always@(posedge clk or posedge rst)begin
         if(rst) begin
            tx_serial <=1'b1;
            tx_busy <=0;
            tx_shift <= 10'b1111111111;
            bit_index <=0;
         end else begin
          if(tx_start && !tx_busy)begin
             tx_shift <= {1'b1, data_in, 1'b0}; 
             tx_busy <=1'b1;
             bit_index <=0;
          end else if(baud_tick && tx_busy)begin
             tx_serial <= tx_shift[0];
             tx_shift <= {1'b1, tx_shift[9:1]};
             bit_index <= bit_index + 1;
             if(bit_index ==9)
                tx_busy <=0;
             end
          end
        end
     
              
           
endmodule
