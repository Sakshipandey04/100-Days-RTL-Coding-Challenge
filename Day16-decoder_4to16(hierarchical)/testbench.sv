module tb_decoder_4to16;
  logic [3:0] in;
  logic en;
  logic [15:0] out;
  
  decoder_4to16 uut(.in(in), .en(en), .out(out));
  
  initial begin
    $dumpfile("decoder_4to16.vcd");
    $dumpvars(0, tb_decoder_4to16);
     
    en= 1;
    for(int i= 0; i<16; i++)
      begin
        in=i;
        #5;
      end
    
    en=0; in = 4'b0000; #5;
    $finish;
  end
endmodule
