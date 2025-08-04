module tb_mux8x1_behavioral;
  reg [7:0] in;
  reg [2:0] sel;
  wire out;
  
  mux8x1_behavioral uut(
    .in(in),
    .sel(sel),
    .out(out)
  );
  initial begin
    $dumpfile("mux8x1.vcd");
    $dumpvars(0, tb_mux8x1_behavioral);
    
    in= 8'b11010110; 
    sel= 3'b000; #5;
    sel= 3'b001; #5;
    sel= 3'b010; #5;
    sel= 3'b011; #5;
    sel= 3'b100; #5;
    sel= 3'b101; #5;
    sel= 3'b110; #5;
    sel= 3'b111; #5;
    $finish;
  end
endmodule
