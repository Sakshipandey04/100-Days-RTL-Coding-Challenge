`timescale 1ns / 1ps

module RAM_module_tb();
    reg clk, rst;
    reg wr_en;
    reg [3:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;
    
    RAM_module dut(
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
    );
    integer i;
    initial clk=0;
    always #5 clk=~clk;
    
    initial begin
      rst=1; wr_en=0; addr=4'd0; 
      data_in=8'd0;
      #15
      rst=0;
    ;
      //write data to all memory locations
      for(i=0; i < 16; i=i+1) begin
          @(negedge clk);
          wr_en=1;
          addr=i;
          data_in= i*2; //example data
          @(negedge clk);
          wr_en=0;
       end
       
       //read back all memory location
       for(i=0; i <16; i=i+1)begin
          @(negedge clk);
          addr=i;
          #1;//small delay to read data_out
          
       end
       #50 $finish;
       end
       initial begin
           $display("Time=%0t | addr=%d wr_en=%b data_in=%d data_out=%d",
           $time, addr, wr_en, data_in, data_out);
           
       end 
endmodule
