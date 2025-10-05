`timescale 1ns / 1ps


module tb_door_controller();
      reg clk, rst;
      reg motion_sensor, obstacle_sensor;
      wire door_open;
      wire door_close;
      wire motor;
      
      door_controller dut(
      .clk(clk),
      .rst(rst),
      .motion_sensor(motion_sensor),
      .obstacle_sensor(obstacle_sensor),
      .door_close(door_close),
      .door_open(door_open),
      .motor(motor)
      );
      
      initial clk=0;
      always #5 clk=~clk;
      initial begin
      rst=1; motion_sensor=0;
      obstacle_sensor=0;
      #15;
      rst=0;
      //person arrives. door should open
      #10 motion_sensor=1;
      #10 motion_sensor=0; 
      //let door open fully and stay open
      #100;
      //door starts closing
      #10;
      //obstacle detected during closing
      obstacle_sensor=1;
      #20 obstacle_sensor=0; 
      //door should reopen after obstacle
      #50;
      #50 $finish;
    end
    initial begin
      $monitor("Time=%0t | motion=%b obstacle=%b | door_open=%b door_close=%b motor=%b",
          $time, motion_sensor, obstacle_sensor,door_close, door_open, motor); 
          end
      
      
      
endmodule
