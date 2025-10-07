`timescale 1ns / 1ps

module tb_RAM_controller();
      reg clk, rst, start;
      wire [7:0] data_out;
      wire done;
      
      RAM_controller dut(
      .clk(clk),
      .rst(rst),
      .start(start),
      .data_out(data_out),
      .done(done)
      );
      
      initial clk=0;
      always #5 clk=~clk;
      
      initial begin
        rst=1; start=0;
        #20 rst=0;
        #20 start =1;
        #10 start =0;
        
        #500 $finish;
     end
     initial begin
       $monitor("Time=%0t | State DataOut=%h | Done=%b", $time, data_out, done);
       end 
     
      
      
endmodule
