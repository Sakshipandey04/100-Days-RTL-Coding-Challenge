`timescale 1ns / 1ps

// Module Name: tb_password_lock
module tb_password_lock();
    reg clk, rst, enter, inbit;
    wire unlock, error;
    
    password_lock dut (.clk(clk), .rst(rst), .enter(enter), .inbit(inbit), .unlock(unlock), .error(error));
    
    initial clk=0;
    always #5 clk=~clk;
    
    task enter_bit(input val);
    begin
      @(negedge clk);
       enter =1;
       inbit= val;
       @(negedge clk);
       enter =0;
    end
  endtask
  
  initial begin
   rst=0; enter=0; inbit=0;
   #20;
   rst=1;
   //correct password sequence
   enter_bit(1);
   enter_bit(0);
   enter_bit(1);
   //incorrect password attempt
   enter_bit(1);
   enter_bit(1);
   enter_bit(0);
   #50;
   $finish;
   end
   
   initial begin
     $monitor("Time=%0t | inbit=%b enter=%b | unlock=%b error=%b", $time, inbit, enter, unlock, error);
   end
endmodule
