module full_adder_behavioral(
  input A,B, Cin,
  output reg Sum, Cout
);
  always@(*)begin
    Sum= A^B^Cin;
    Cout= (A&B) |(B&Cin)|(Cin&A);
    end
endmodule
