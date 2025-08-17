module excess3_to_bcd(
  input [3:0] excess3,
  output reg [3:0] bcd
);
  always@(*)begin
    if(excess3 >= 4'd3 && excess3 <= 4'd12)
      bcd= excess3 - 4'd3;
    else
      bcd= 4'bxxxx;
  end
endmodule
