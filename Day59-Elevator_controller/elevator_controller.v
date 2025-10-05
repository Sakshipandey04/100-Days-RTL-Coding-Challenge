`timescale 1ns / 1ps

module elevator_controller(
     input wire clk,
     input wire rst, 
     input wire call1, //floor 1 call button
     input wire call2, //floor 2 call button
     input wire floor_sensor, // 0: floor 1, 1: floor 2
     output reg motor_up,
     output reg motor_down,
     output reg door_open
    );
    
    //state encoding
    reg [2:0] state, next_state;
    localparam
              IDLE_F1 = 3'b000,
              IDLE_F2 = 3'b001,
              MOVE_UP = 3'b010,
              MOVE_DOWN= 3'b011,
              DOOR_OPEN= 3'b100;
              
              //next state logic
              always@(*) begin
                   next_state = state; //default hold
                   case(state)
                       IDLE_F1: begin
                           if(call2) next_state = MOVE_UP;
                         end
                         IDLE_F2: begin
                            if(call1) next_state = MOVE_DOWN;
                         end
                         MOVE_UP: begin
                           if(floor_sensor ==1) next_state = DOOR_OPEN;
                         end
                         MOVE_DOWN: begin
                           if(floor_sensor==0) next_state = DOOR_OPEN;
                         end 
                         DOOR_OPEN: begin
                            if(floor_sensor == 0) next_state = IDLE_F1;
                            else next_state = IDLE_F2;
                         end
                      endcase
                   end
                            
                 //system update on clock
                 always@(posedge clk)begin
                    if(rst)
                       state <= IDLE_F1;
                    else
                       state <= next_state;
                    end
                    
                    //Output logic
                    always@(*)begin
                       motor_up=0;
                       motor_down=0;
                       door_open=0;
                       case(state)
                          MOVE_UP: motor_up=1;
                          MOVE_DOWN: motor_down=1;
                          DOOR_OPEN: door_open=1;
                        endcase
                      end
                      
                 
                 
                            
              
                           
               
endmodule
