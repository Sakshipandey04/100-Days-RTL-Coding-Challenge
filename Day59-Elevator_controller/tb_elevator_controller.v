`timescale 1ns / 1ps



module tb_elevator_controller();
   reg clk,rst;
   reg call1, call2;
   reg floor_sensor;
   wire motor_up;
   wire motor_down;
   wire door_open;
   
   //instantiate DUT
   elevator_controller dut(
   .clk(clk), 
   .rst(rst),
   .call1(call1),
   .call2(call2),
   .floor_sensor(floor_sensor),
   .motor_up(motor_up),
   .motor_down(motor_down),
   .door_open(door_open)
   );
   
   //clock generation
   initial clk=0;
   always #5 clk=~clk;
   
   initial begin
      rst=1; call1=0; call2=0;
      floor_sensor=0; //start at floor 1
      #15 rst=0;
      
      //floor 2 call from floor 1
      
      #10 call2=1;
      #10 call2=0;
      //simulate elevator moving up
      #20 floor_sensor=1; //reaches floor 2
      #10;
      //floor 1 call from floor 2
      #10 call1=1;
      #10 call1=0;
      
      //simulate elevatorr moving down
      #20 floor_sensor=0; //reaches floor 1
      
      
      #50 $finish;
    end
    initial begin
       $monitor("Time=%0t | Floor=%b | call1=%b call2=%b | motor_up=%b motor_down=%b door_open=%b",
       $time, floor_sensor, call1, call2, motor_up, motor_down,door_open);
       end
        
       
       
    
      
endmodule
