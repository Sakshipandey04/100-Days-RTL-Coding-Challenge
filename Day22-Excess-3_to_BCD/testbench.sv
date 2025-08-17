`timescale 1ns/1ps
module tb_excess3_to_bcd;
  reg [3:0] excess3;
  wire [3:0] bcd;
  
  excess3_to_bcd uut(
    .excess3(excess3), .bcd(bcd));
  initial begin
    $dumpfile("excess3_to_bcd.vcd");
    $dumpvars(0, tb_excess3_to_bcd);
    
    excess3= 4'd3; #10;
    excess3= 4'd4; #10;
    excess3= 4'd5; #10;
    excess3= 4'd8; #10;
    excess3= 4'd12; #10;
    excess3= 4'd2; #10;
    $finish;
  end
endmodule
