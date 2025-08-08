`timescale 1ns/1ps

module tb_gray_to_binary;
  reg [3:0] gray_in;
  wire [3:0] binary_out;
  
  gray_to_binary uut(
    .gray_in(gray_in),
    .binary_out(binary_out)
  );
  initial begin
    $dumpfile("gray_to_binary.vcd");
    $dumpvars(0, tb_gray_to_binary);
    
    gray_in= 4'b0000; #10;
    gray_in= 4'b0001; #10;
    gray_in= 4'b0011; #10;
    gray_in= 4'b0010; #10;
    gray_in= 4'b0000; #10;
    gray_in= 4'b0110; #10;
    gray_in= 4'b0111; #10;
    gray_in= 4'b0101; #10;
    gray_in= 4'b0100; #10;
    gray_in= 4'b1100; #10;
    gray_in= 4'b1101; #10;
    $finish;
  end
endmodule
        
    
    

           
