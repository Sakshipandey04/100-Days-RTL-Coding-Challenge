`timescale 1ns / 1ps

module tb_universal_counter();

    parameter WIDTH=4;
    reg clk, rst, enable;
    reg [1:0] mode;
    wire [WIDTH-1:0] count;
    
    universal_counter #(.WIDTH(WIDTH)) uut(
       .clk(clk),
       .rst(rst),
       .enable(enable),
       .mode(mode),
       .count(count)
       );
       
       always #5 clk=~clk;
       
       initial begin
           clk=0; rst=1; enable=0; mode=2'b00;
           //count up
           #20 rst=0;
           enable=1; mode= 2'b01;
           #100;
           //count down
           mode=2'b10;
           #100;
           //up-down counting
           mode= 2'b11;
           #100;
           
           enable =0;
           #50;
           $stop;
        end
        initial begin
           $monitor("Time=%0t | Mode=%b | Enable=%b | Count=%d", $time, mode, enable, count);
         end

endmodule
