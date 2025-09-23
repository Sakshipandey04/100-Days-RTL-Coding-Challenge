`timescale 1ns / 1ps 
// Create Date: 23.09.2025 11:57:15
// Module Name: PIPO_reg_tb



module PIPO_reg_tb();
     parameter N= 8;
     reg clk, rst, load;
     reg [N-1:0] p_data;
     wire [N-1:0] q;
     
     PIPO_reg dut(
     .clk(clk),
     .rst(rst),
     .load(load),
     .p_data(p_data),
     .q(q)
     );
     
     always #5 clk= ~clk;
     
     
    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        load = 0;
        p_data = 8'b00000000;

        // Release reset
        #10 rst = 0;

        // Load first data
        #10 load = 1; p_data = 8'b10101010;
        #10 load = 0;

        // Hold value
        #20;

        // Load new data
        #10 load = 1; p_data = 8'b11001100;
        #10 load = 0;

        // Hold value
        #20;

        // Finish simulation
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | load=%b | p_data=%b | q=%b",
                  $time, rst, load, p_data, q);
    end

endmodule
