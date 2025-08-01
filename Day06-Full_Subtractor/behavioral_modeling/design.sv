module full_subtractor_behave(
  input A, B, Bin,
  output reg Diff, Bout
);
  always@(*)begin
  Diff= A^B^Bin;
  Bout= (~A&B)|(~(A^B)&Bin);
  end
endmodule
