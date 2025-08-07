module priority_encoder_4to2(
  input[3:0] data_in,
  output reg [1:0] encoded_out,
  output reg valid
);
  always@(*) begin
     valid= 1'b1;
    casez(data_in)
      4'b1???: encoded_out= 2'b11;
      4'b01?? : encoded_out = 2'b10;
      4'b001? : encoded_out = 2'b01;
      4'b0001: encoded_out= 2'b00;
      default: begin
        encoded_out= 2'b00;
        valid= 1'b0;
      end
    endcase
  end
endmodule
    
