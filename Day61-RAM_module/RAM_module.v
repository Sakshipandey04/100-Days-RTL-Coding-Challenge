`timescale 1ns / 1ps
module RAM_module(
    input wire clk,
    input wire rst,
    input wire wr_en, //wire enable
    input wire[3:0] addr, //4 bit address(16 locations)
    input wire [7:0] data_in, //data to write
    output reg[7:0] data_out //data read
    );
    
    //memory arry: 16 words x 8 bits
    reg [7:0] mem[0:15];
    integer i;
    
    always @(posedge clk)begin
       if(rst)begin  
          for(i=0; i<16; i=i+1)
              mem[i] <=8'd0;
           data_out <= 8'd0;
       end
       else begin
          //write operation
          if(wr_en)
             mem[addr] <= data_in;
          //read operation
          data_out <= mem[addr];
       end
    end
       
    
endmodule
