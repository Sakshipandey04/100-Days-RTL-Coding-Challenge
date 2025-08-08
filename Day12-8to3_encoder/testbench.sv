`timescale 1ns / 1ps
module tb_encoder_8to3;

reg  [7:0] data_in;
wire [2:0] encoded_out;
wire       valid;

encoder_8to3 uut (
    .data_in(data_in),
    .encoded_out(encoded_out),
    .valid(valid)
);

initial begin
    $dumpfile("encoder_8to3.vcd");
    $dumpvars(0, tb_encoder_8to3);

    data_in = 8'b00000000; #10;
    data_in = 8'b00000001; #10;
    data_in = 8'b00000010; #10;
    data_in = 8'b00000100; #10;
    data_in = 8'b00001000; #10;
    data_in = 8'b00010000; #10;
    data_in = 8'b00100000; #10;
    data_in = 8'b01000000; #10;
    data_in = 8'b10000000; #10;
    data_in = 8'b11111111; #10;

    $finish;
end

endmodule
