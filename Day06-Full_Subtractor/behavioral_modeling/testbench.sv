module tb_full_subtractor_beahve;
  reg A, B, Bin;
  wire Diff, Bout;
  
  full_subtractor_behave uut(
    .A(A), .B(B), .Bin(Bin), .Diff(Diff), .Bout(Bout)
  );
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    A=0; B=0;Bin=0; #10;
    A=0; B=0;Bin=1; #10;
    A=0; B=1;Bin=0; #10;
    A=0; B=1;Bin=1; #10;
    A=1; B=0;Bin=0; #10;
    A=1; B=0;Bin=1; #10;
    A=1; B=1;Bin=0; #10;
    A=1; B=1;Bin=1; #10;
    $finish;
  end
endmodule
