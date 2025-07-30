module half_adder(input A, B, output Sum, Carry);
  assign Sum = A ^ B;
  assign Carry = A & B;
endmodule

module full_adder_struct(input A, B, Cin, output Sum, Cout);
  wire sum1, carry1, carry2;

  half_adder HA1 (.A(A), .B(B), .Sum(sum1), .Carry(carry1));
  half_adder HA2 (.A(sum1), .B(Cin), .Sum(Sum), .Carry(carry2));

  assign Cout = carry1 | carry2;
endmodule
