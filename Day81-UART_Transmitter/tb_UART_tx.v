`timescale 1ns / 1ps

module tb_UART_tx();
    reg clk, rst, tx_start;
    reg [7:0] data_in;
    wire tx_serial, tx_busy;
    
    UART_tx dut(
    .clk(clk),
    .rst(rst),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx_serial(tx_serial),
    .tx_busy(tx_busy)
    );
    
    initial clk=0;
    always #5 clk=~clk;
    
    initial begin 
      rst=1; tx_start=0;
      data_in=8'h00;
      #20  rst=0;
      
      #20 data_in=8'hA5; tx_start=1;
      #10 tx_start=0;
      
      #20 data_in = 8'h3C; tx_start=1;
      #10 tx_start=0;
      #5000 $finish;
    end
    
    initial begin
        $dumpfile("UART_tx.vcd");
        $dumpvars(0, tb_UART_tx);
      end
      
      
    
endmodule
