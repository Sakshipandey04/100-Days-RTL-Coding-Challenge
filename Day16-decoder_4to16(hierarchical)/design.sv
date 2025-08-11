module decoder_3to8(
  input logic[3:0] in,
  input logic en,
  output logic [7:0] out
  
);
  always@(*)begin
    if(en)
      out= 8'b00000001 << in;
    else
      out= 8'b00000000 ;
  end
endmodule

module decoder_4to16(
  input logic [3:0] in,
  input logic en,
  output logic [15:0] out
);
  
  logic [7:0] out_low, out_high;
  
  decoder_3to8 d0(.in(in[2:0]), .en(en & ~in[3]), .out(out_low));
  decoder_3to8 d1(.in(in[2:0]), .en(en & in[3]), .out(out_high));
  
  assign out= {out_high, out_low};
endmodule
