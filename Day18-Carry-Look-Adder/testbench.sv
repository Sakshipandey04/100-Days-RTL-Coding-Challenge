`timescale 1ns/1ps
module tb_cla_4bit;
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] Sum;
  wire Cout;
  
  cla_4bit uut(
    .A(A), .B(B), .Sum(Sum), .Cout(Cout));
 
  initial begin
    $dumpfile("cla_4bit.vcd");
    $dumpvars(0, tb_cla_4bit);
    A= 4'b0000; B=4'b0000; Cin=0; #10;
    A= 4'b0101; B=4'b0011; Cin=0; #10;
    A= 4'b1111; B=4'b0001; Cin=0; #10;
    A= 4'b1010; B=4'b0101; Cin=1; #10;
    A= 4'b1111; B=4'b1111; Cin=0; #10;
    
    $finish;
  end
  initial begin
    $monitor("Time=%0t | A= %b B=%b Cin= %b => Sum = %b Cout= %b", $time, A, B, Cin, Sum, Cout);
  end
endmodule
