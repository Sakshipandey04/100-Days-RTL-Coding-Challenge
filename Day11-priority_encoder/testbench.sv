`timescale 1ns/1ps
module tb_priority_encoder_4to2;
  reg[3:0] data_in;
  wire [1:0] encoded_out;
  wire valid;
  
  priority_encoder_4to2 uut(
    .data_in(data_in),
    .encoded_out(encoded_out),
    .valid(valid)
  );
  initial begin
    $dumpfile("priority_encoder_4to2.vcd");
    $dumpvars(0, tb_priority_encoder_4to2);
    data_in= 4'b0000; #10;
    data_in= 4'b0001; #10;
    data_in= 4'b0010; #10;
    data_in= 4'b0100; #10;
    data_in= 4'b1000; #10;
    data_in= 4'b1010; #10;
    data_in= 4'b1111; #10;
    $finish;
  end
endmodule
