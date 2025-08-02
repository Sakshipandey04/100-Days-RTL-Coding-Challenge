module mux2x1_struct(input A, B, Sel, output reg Y);
  wire not_sel, and1, and2;
  
  not(not_sel, Sel);
  and(and1, A, not_sel);
  and(and2, B, and2);
  or(Y, and1, and2);
endmodule
