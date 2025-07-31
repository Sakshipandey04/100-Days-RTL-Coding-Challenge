module half_subtractor_behave(
  input A, B,
  output reg Diff, Borrow
);
  always@(*)begin
    Diff= A^B;
    Borrow= (~A)&B;
  end
endmodule

