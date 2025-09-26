`timescale 1ns / 1ps

module seq_detector(
    input wire clk,
    input wire rst,
    input wire x,
    output reg y
    );
    parameter 
        S0 = 2'b00, //start
        S1 = 2'b01, //Got '1'
        S2 = 2'b10, //Got'10'
        S3 = 2'b11; //Got '101'
        
        reg[1:0] state, next_state;
        //state transition(sequential)
        always@(posedge clk or posedge rst) begin
            if(rst)
                state <= S0;
             else
                state <= next_state;
                
            end
            
         //next state + output logic
         always@(*)begin
            y=0; //default
            case(state)
              S0 : begin 
                if(x)
                  next_state = S1;
                else
                  next_state = S0;
               end
              S1 : begin
                if(x)
                   next_state = S1;
                else
                  next_state = S2;
              end
             S2 : begin
               if(x)
                  next_state = S3;
               else
                 next_state = S0;
              end
             S3 : begin
             if(x)begin
               next_state = S1;
               y=1;
             end
             else begin
                next_state = S2;
             end
          end
          default : next_state = S0;
       endcase
      end               
              
endmodule
