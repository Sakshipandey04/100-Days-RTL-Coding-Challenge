module tb_full_adder_df;
  reg A,B, Cin;
  wire Sum, Cout;
  
  full_adder_df uut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
     A= 0; B=0; Cin=0; #10;
     A=0; B=1; Cin=0; #10;
    A=1; B=0; Cin=0; #10;
    A=1; B=1; Cin=0; #10;
    A=0; B=0; Cin=1; #10;
    A=0; B=1; Cin=1; #10;
    A=1; B=0; Cin=1; #10;
    A=1; B=1; Cin=1; #10;
    
    $finish;
  end
endmodule
    
