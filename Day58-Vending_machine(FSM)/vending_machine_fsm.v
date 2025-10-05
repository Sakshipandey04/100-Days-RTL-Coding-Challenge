`timescale 1ns / 1ps

module vending_machine_fsm(
      input wire clk,
      input wire rst,
      input wire coin10, //pulse for 10 units
      input wire coin25, //pulse for 25 units
      input wire sel,   //0: Product A(25 Units), 1: Product B (40 units)
      input wire buy, // pulse to attempt purchase
      output reg dispense, //one-clock pulse
      output reg [7:0] change //change in units
    );
    localparam PRICE_A = 8'd25;
    localparam PRICE_B = 8'd40;
    
    reg[7:0] total;
    
    always @(posedge clk)begin
      if(rst)begin
        total <= 8'd0;
        dispense <= 1'd0;
        change <= 8'd0;
      end else begin
        dispense <= 1'b0;
        change <= 8'd0;
        
        //Accumulate Coins
        if(coin10) total <= total + 8'd10;
        if(coin25) total <= total + 8'd25;
        
        
       //Check for Updates
       if(buy) begin
         if(sel == 1'b0)begin
           //Product A
           if(total>= PRICE_A)begin
              dispense <= 1'b1;
              change <= total - PRICE_A;
              total <= 8'd0;
           end
         end else begin
         //Product B
         if(total >= PRICE_B) begin
            dispense <= 1'b1;
            change <= total - PRICE_B;
            total <= 8'd0;
          end
        end
     end
    end
 end

               
      
endmodule
