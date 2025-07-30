module half_adder_structural(
  input a, b,
  output sum, carry
);
  wire n1,n2,n3,n4;
  xor(sum, a, b);
  and(carry, a,b);
endmodule
