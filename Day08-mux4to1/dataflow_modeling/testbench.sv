module tb_mux4x1_df;
  reg [1:0] sel;
  reg A,B, C,D;
  wire Y;
  mux4x1_df uut(
    .A(A), .B(B), .C(C), .D(D), .Sel(sel), .Y(Y));
  initial begin
    $dumpfile("mux4x1.vcd");
    $dumpvars(0, tb_mux4x1_df);
    A=0; B=1; C= 0; D=1;
    sel=2'b00; #10;
    sel=2'b01; #10;
    sel=2'b10; #10;
    sel= 2'b11; #10;
    
    $finish;
  end
 endmodule
