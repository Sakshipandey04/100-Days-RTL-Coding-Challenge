`timescale 1ns / 1ps

// Create Date: 05.09.2025 19:06:26
 
// Module Name: tb_T_SR_ff

module tb_T_SR_ff;
    reg clk, S, R;
    wire Q;
    
   T_to_SR uut(
   .clk(clk),
   .S(S),
   .R(R),
   .Q(Q)
   );
   
   initial begin
     clk=0;
     forever #5 clk= ~clk;
   end
   
 initial begin
   
   S=0; R=0;
   #10;
   S=1; R=0; 
   #10; 
   S=0; R=1; 
   #10;
   S=0; R=0; 
   #10;
   S=1; R=1;
   #10;
   S=0; R=0;
   #10; $stop;
end
   
endmodule
