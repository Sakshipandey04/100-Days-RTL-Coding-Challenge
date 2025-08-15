`timescale 1ns/1ps
module tb_parity_checker;
  reg [3:0] data_in;
  reg parity_bit;
  reg mode;
  wire error;
  
  parity_checker uut (
    .data_in(data_in), .parity_bit(parity_bit), .mode(mode), .error(error));
  
  initial begin
    $dumpfile("parity_checker.vcd");
    $dumpvars(0, tb_parity_checker);
    mode= 0;
    data_in= 4'b0000; parity_bit=0; #10;
    data_in= 4'b0001; parity_bit= 1; #10;
    data_in= 4'b0001; parity_bit= 0; #10;
    
    mode=1;
    data_in = 4'b0000; parity_bit=1; #10;
    data_in = 4'b0001; parity_bit= 0; #10;
    data_in= 4'b0001; parity_bit= 1; #10;
    
    $finish;
   end
endmodule
