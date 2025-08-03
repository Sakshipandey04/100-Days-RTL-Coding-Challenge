module mux4x1_df(input A, B, C, D, input [1:0] Sel, output Y);
  assign Y = (Sel == 2'b00)? A:(Sel== 2'b01)? B: (Sel== 2'b10)? C:D;
  
endmodule
