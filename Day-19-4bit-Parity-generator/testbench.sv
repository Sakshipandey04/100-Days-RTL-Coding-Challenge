`timescale 1ns/1ps
module tb_parity_generator;
  reg [3:0] data_in;
  wire even_parity;
  wire odd_parity;
  
  parity_generator uut (
    .data_in(data_in), .even_parity(even_parity), .odd_parity(odd_parity));
  
  initial begin
    $dumpfile("parity_generator.vcd");
    $dumpvars(0, tb_parity_generator);
    
    data_in= 4'b0000; #10;
    data_in= 4'b0001; #10;
    data_in = 4'b0011; #10;
    data_in = 4'b0111; #10;
    data_in = 4'b1111; #10;
    data_in = 4'b0101; #10;
    data_in = 4'b1101; #10;
    
    $finish;
   end
endmodule
