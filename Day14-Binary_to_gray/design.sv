module binary_to_gray(
  input [3:0] binary_in,
  output reg [3:0] gray_out
);
  always@(*)begin
    gray_out[3]= binary_in[3]; //MSB remains the same
    for(integer i= 2; i >=0; i= i-1)begin
      gray_out[i]= binary_in[i+1] ^ binary_in[1];
    end
  end
  
endmodule
