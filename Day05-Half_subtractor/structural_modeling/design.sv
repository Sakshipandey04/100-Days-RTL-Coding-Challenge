module half_subtractor_struct(input A, B, output Diff, Borrow);
  
  wire notA;
  
  not(notA, A);
  xor(Diff, A, B);
  and(Borrow, notA, B);
endmodule

