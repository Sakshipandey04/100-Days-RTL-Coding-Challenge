`timescale 1ns / 1ps

module door_controller(
    input wire clk,
    input wire rst,
    input wire motion_sensor, //detects presence near the door
    input wire obstacle_sensor,  //detects obstacle while closing
    output reg door_open, // door fully open
    output reg door_close, // door fully closed
    output reg motor //motor active
    
    );
    
    //state encoding
    reg [2:0] state, next_state;
    localparam
            CLOSED= 3'b000,
            OPENING= 3'b001,
            OPEN=3'b010,
            CLOSING=3'b011,
            STOPPED=3'b100;
            //timer counter for keeping door open
            reg[3:0] timer; //adjust width as needed
            
            //next state logic
            always @(*)begin
               next_state = state;
               case(state)
                   CLOSED: begin
                      if(motion_sensor) next_state = OPENING;
                   end
                   OPENING : begin
                      if(timer== 4'd10) //door fully open after timer expires
                          next_state =OPEN;
                      end
                      OPEN:begin
                         if(timer == 4'd10) //stay open for a set duration
                            next_state= CLOSING;
                       end
                       
                       CLOSING:begin
                          if(obstacle_sensor) next_state= STOPPED;// stay open for a duration
                           else if(timer== 4'd10)next_state = CLOSED;
                          
                     end
                     STOPPED:begin
                        if(~obstacle_sensor) next_state= OPENING;
                    end
                    default:next_state= CLOSED;
                 endcase
              end
              //state update and timer logic
              always@(posedge clk) begin
                 if(rst) begin
                    state <= CLOSED;
                    timer <=0;
                 end else begin
                     state <= next_state;
                     //increament timer in relevant states
                  if(next_state == OPENING || next_state == OPEN || next_state == CLOSING)
                     timer <= timer + 1;
                   else
                      timer <=0;
                  end
              end
             //output logic
             always@(*)begin
                door_open=0;
                door_close=0;
                motor=0;
                
                case(state)
                   CLOSED: door_close=1;
                   OPENING: motor=1;
                   OPEN: door_open=1;
                   CLOSING : motor=1;
                   STOPPED: motor=0; //motor stopped due to obstacle
                endcase 
             end
             
                      
                                     
            
    
endmodule
