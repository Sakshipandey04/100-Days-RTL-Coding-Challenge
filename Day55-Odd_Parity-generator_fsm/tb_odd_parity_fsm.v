`timescale 1ns / 1ps
// Module Name: tb_odd_parity_fsm



module tb_odd_parity_fsm();
   reg clk, rst, load, valid,din;
   wire parity;
   
   
   odd_parity_fsm dut(.clk(clk), .rst(rst), .load(load), .valid(valid), .din(din), .parity(parity)
   );
   initial clk=0;
   always #5 clk = ~clk;
   
   task apply_bit;
      input val;
   begin
      @(negedge clk);
      valid=1;
      din= val;
      @(negedge clk);
      valid =0;
   end
   endtask
   
   initial begin
    rst=0; load=0; valid=0;din=0;
    #20;
    rst=1;
    
    @(negedge clk);
    load=1;
    @(negedge clk);
    load=0;
    //apply sequenc 1,0,1,1
    apply_bit(1); //parity=1
    apply_bit(0); //parity=0
    apply_bit(1);
    apply_bit(1);
   
   @(negedge clk);
   load=0;  
   apply_bit(0); 
   apply_bit(1);
   apply_bit(1);
   
   #50;
   $finish;
end
initial begin 
  $monitor("Time=%0t | din=%b valid=%b load=%b | parity=%b", $time, din, valid, load, parity);
  end 
endmodule
