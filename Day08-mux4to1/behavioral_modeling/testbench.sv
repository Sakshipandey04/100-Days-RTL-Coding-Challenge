module tb_mux4x1_behave;
  reg A,B,C,D;
  reg[1:0] Sel;
  wire Y;
  
  mux4x1_behave uut(.A(A), .B(B), .C(C), .D(D), .Sel(Sel), .Y(Y));
  
  initial begin
    $dumpfile("mux4x1.vcd");
    $dumpvars(0, tb_mux4x1_behave);
    A=0; B=1; C=0; D=1;
    Sel= 2'b00; #10;
    Sel= 2'b01; #10;
    Sel= 2'b10; #10;
    Sel= 2'b11; #10;
    $finish;
  end
endmodule
