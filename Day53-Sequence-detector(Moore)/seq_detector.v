`timescale 1ns / 1ps
// Create Date: 23.09.2025 17:06:38
// Module Name: seq_detector


module seq_detector(
     input wire clk,
     input wire rst, 
     input wire x, // serial input bit
     output reg y //output reg y
     );
    
    //state encoding
    parameter 
         S0= 3'b000,//start state
         S1= 3'b001, //Got '1'
         S2= 3'b010, //Got '10'
         S3= 3'b011, //Got '101'
         S4= 3'b100;  //Got '1011' (output)
      
         reg[2:0] state, next_state; //state register
         //state transition (sequential block)
         always @(posedge clk or posedge rst)begin
              if(rst)
                 state <= S0;
              else
                 state <= next_state;
          end
          
          //next state logic(combinational block)
           always @(*)begin
              case(state)
                  S0: next_state = (x) ? S1: S0;
                  S1: next_state =(x) ? S1: S2;
                  S2: next_state= (x) ? S3: S0;
                  S3: next_state = (x) ? S4: S3;
                  S4: next_state= (x) ? S1: S2; //overlapping detection
                  default : next_state =S0;
                endcase
                
            end
         //output logic (Moore :depends on state)       
          always@(*)begin
             case(state)
                S4: y=1'b1;
                default : y=1'b0;
              endcase
           end     
          
         
endmodule
