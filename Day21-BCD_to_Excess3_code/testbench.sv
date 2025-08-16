`timescale 1ns/1ps
module tb_bcd_to_excess3;
  reg [3:0] bcd;
  wire [3:0] excess3;
  
  bcd_to_excess3 uut(
    .bcd(bcd), .excess3(excess3));
  
  initial begin
    $dumpfile("bcd_to_excess3.vcd");
    $dumpvars(0, tb_bcd_to_excess3);
    
    bcd= 4'd0; #10;
    bcd= 4'd1; #10;
    bcd= 4'd2; #10;
    bcd= 4'd5; #10;
    bcd= 4'd7; #10;
    bcd= 4'd9; #10;
    
    $finish;
  end
endmodule
