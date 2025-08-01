module half_subtractor(
  input A, B,
  output reg Diff, Borrow
);
  assign Diff= A^B;
  assign Borrow= ~A&B;
endmodule

module full_subtractor_struct(input A,B, Bin, output Diff, Bout);
  wire d1, b1, b2;
  half_subtractor hs1(.A(A), .B(B), .Diff(d1), .Borrow(b1));
  half_subtractor hs2
  (.A(d1), .B(Bin), .Diff(Diff), .Borrow(b2)
  );
  or(Bout, b1, b2);
endmodule
