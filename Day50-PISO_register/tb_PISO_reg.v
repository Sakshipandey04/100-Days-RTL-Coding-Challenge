`timescale 1ns / 1ps

// Create Date: 18.09.2025 21:25:13

// Module Name: tb_PISO_reg


module tb_PISO_reg();
     parameter N=8;
     reg clk, rst, load, shift_en;
     reg [N-1:0] p_data;
     wire s_data;
     
     PISO_reg dut(
     .clk(clk),
     .rst(rst),
     .load(load),
     .shift_en(shift_en),
     .p_data(p_data),
     .s_data(s_data)
   );
   always #5 clk=~clk;
   initial begin
      clk=0;
      rst=1;
      load=0;
      shift_en=0;
      p_data= 8'b00000000;
      
      #10 rst=0;
      #10 load =1; p_data = 8'b11010110;
      #10 load=0;
      
      shift_en=1;
      #80 shift_en=0;
      #20 $finish;
    end  
endmodule
