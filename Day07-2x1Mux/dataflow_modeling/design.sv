module mux2x1_df(input A, B, Sel, output Y);
  assign Y= (~Sel & A)| (Sel & B);
endmodule
