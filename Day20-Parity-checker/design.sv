module parity_checker(
  input [3:0] data_in,
  input parity_bit,
  input mode,
  output reg error
);
  reg computed_parity;
  always@(*)begin
    computed_parity= ^data_in;
    if(mode==0)begin
      error= (computed_parity != parity_bit) ? 1'b1: 1'b0;
    end
    else begin
      error= (~computed_parity != parity_bit) ? 1'b1: 1'b0;
    end
      
  end
endmodule
