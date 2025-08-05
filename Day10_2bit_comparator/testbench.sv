module tb_comparator_behave;
  reg [1:0] A, B;
  wire gt, lt, et;
  comparator_behave uut(
    .A(A), .B(B), .gt(gt), .lt(lt), .et(et)
  );
  initial begin
    $dumpfile("comparator_behave.vcd");
    $dumpvars(0, tb_comparator_behave);
    
    A= 2'b00; B=2'b00; #10;
    A= 2'b01; B=2'b00; #10;
    A= 2'b10; B=2'b10; #10;
    A= 2'b11; B=2'b01; #10;
    A= 2'b00; B=2'b11; #10;
    
    $finish;
  end
endmodule
