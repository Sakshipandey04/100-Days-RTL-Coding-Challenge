module tb_mux2x1_behave;
  reg A, B, Sel;
  wire Y;
  mux2x1_behave uut(.A(A), .B(B), .Sel(Sel), .Y(Y));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    A=0; B=0; Sel =0; #10;
    A=0; B=0; Sel =1; #10;
    A=0; B=1; Sel =0; #10;
    A=0; B=1; Sel =1; #10;
    A=1; B=0; Sel =0; #10;
    A=1; B=0; Sel =1; #10;
    A=1; B=1; Sel =0; #10;
    A=1; B=1; Sel =1; #10;
    $finish;
  end
endmodule
