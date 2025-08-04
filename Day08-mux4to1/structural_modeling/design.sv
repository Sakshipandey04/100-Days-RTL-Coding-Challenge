module mux4x1_struct(
  input A,B,C,D,
  input [1:0] Sel,
  output reg Y);
 
  wire notS0, notS1;
  wire and0, and1, and2, and3;
  
  not(notS0, Sel[0]);
  not(notS1, Sel[1]);
  
  and(and0, A, notS1, notS0);
  and(and1, B, notS1, Sel[0]);
  and(and2, C, Sel[1], notS0);
  and(and3, D, Sel[1], Sel[0]);
  
  or(Y, and0, and1, and2, and3);
endmodule
