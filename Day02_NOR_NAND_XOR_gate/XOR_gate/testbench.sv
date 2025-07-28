
module test_XOR_gate;
  reg a, b;
  wire y;

  XOR_gate uut(
     .a(a),
     .b(b),
     .y(y)
);

initial begin
  $dumpfile("dump_XOR.vcd");
  $dumpvars(0, test_XOR_gate);
  
  $monitor("Time = %0t | a= %b, b= %b =>y = %b", $time, a, b, y);
  a= 0; b=0; #10;
  a=0; b=1; #10;
  a= 1; b=0; #10;
  a= 1; b=1; #10;
  $finish;
end
endmodule
  
