module parity_generator(
  input [3:0] data_in,
  output reg even_parity,
  output reg odd_parity
);
  always@(*) begin
    even_parity = ^data_in ? 1'b1 : 1'b0;
    odd_parity= ~even_parity;
  end
endmodule
