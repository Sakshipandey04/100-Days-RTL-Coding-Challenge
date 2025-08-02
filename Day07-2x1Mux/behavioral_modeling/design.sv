module mux2x1_df(input A, B, Sel, output Y);
  always@(*)begin
    case(Sel)
      1'b0: Y=A;
      1'b1: Y=B;
    endcase
  end
endmodule
