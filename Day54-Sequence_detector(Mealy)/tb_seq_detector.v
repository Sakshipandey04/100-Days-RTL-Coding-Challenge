`timescale 1ns / 1ps

module tb_seq_detector();
   reg  clk, rst, x;
   wire y;
   
   seq_detector uut(
   .clk(clk),
   .rst(rst),
   .x(x),
   .y(y)
   );
   
   //clock generation : 10ns period
   always #5 clk= ~clk;
   
   initial  begin
      clk=0; rst=1;
      x=0;
      //input sequence : 1011011
      #10 rst=0;
      #10 x=1; //'1'
      #10 x=0; //'10'
      #10 x=1; //'101'
      #10 x=1; //'1011' (y=1 here)
      #10 x=0; 
      #10 x=1;
      #10 x=1; // y=1 again
      #20;
      $finish;
    end
    initial begin
       $monitor("Time=%0t | x=%b | y=%b | state=%b", $time , x, y, uut.state);
    end
      
   
   
endmodule
