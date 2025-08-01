module full_subtractor_df(
  input A, B, Bin,
  output Diff, Bout
);
  assign Diff= A^B^Bin;
  assign Bout= (~A&B)|(~(A^B)&Bin);
endmodule
