`timescale 1ns/1ps
module tb_binary_to_gray;
  reg [3:0] binary_in;
  wire [3:0] gray_out;
  
  binary_to_gray uut(
    .binary_in(binary_in),
    .gray_out(gray_out)
  );
  initial begin
    $dumpfile("binary_to_gray.vcd");
    $dumpvars(0, tb_binary_to_gray);
    
    binary_in= 4'b0000; #10;
    binary_in= 4'b0001; #10;
    binary_in= 4'b0010; #10;
    binary_in= 4'b0011; #10;
    binary_in= 4'b0100; #10;
    binary_in= 4'b0101; #10;
    binary_in= 4'b0110; #10;
    binary_in= 4'b0111; #10;
    binary_in= 4'b1000; #10;
    binary_in= 4'b1001; #10;
    binary_in= 4'b1010; #10;
    binary_in= 4'b1011; #10;
    binary_in= 4'b1100; #10;
    binary_in= 4'b1101; #10;
    binary_in= 4'b1110; #10;
    binary_in= 4'b1111; #10;
    
    $finish;
  end
endmodule
    
    
