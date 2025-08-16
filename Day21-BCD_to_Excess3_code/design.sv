module bcd_to_excess3(
  input [3:0] bcd,
  output reg [3:0] excess3
);
  always@(*) begin
    if(bcd <=4'd9)
      excess3= bcd + 4'd3;
    else
      excess3= 4'bxxxx;
  end
endmodule
