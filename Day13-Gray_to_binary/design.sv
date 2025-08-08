module gray_to_binary(
  input [3:0] gray_in,
  output reg [3:0] binary_out
);
  integer i;
  
  always@(*)begin
    
    binary_out[3]= gray_in[3]; //MSB remains same
    for(i=2; i>=0; i=i-1) begin
      binary_out[i]= binary_out[i+1] ^ gray_in[i];
    end
  end
  
endmodule
