module tb_half_subtractor_behave;
  reg A,B;
  wire Diff, Borrow;
  
  half_subtractor_behave uut(
    .A(A), .B(B), .Diff(Diff), .Borrow(Borrow));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;
    $finish;
  end
endmodule
