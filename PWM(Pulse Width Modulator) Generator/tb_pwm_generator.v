
`timescale 1ns / 1ps
module tb_pwm_generator;

    parameter WIDTH = 8;
    reg clk, rst, enable;
    reg [WIDTH-1:0] duty;
    wire pwm_out;

    // DUT Instantiation
    pwm_generator #(.WIDTH(WIDTH)) uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .duty(duty),
        .pwm_out(pwm_out)
    );

    // Clock generation
    always #5 clk = ~clk; // 100 MHz clock

    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        enable = 0;
        duty = 0;

        #20 rst = 0;
        enable = 1;

        // Sweep duty cycle
        duty = 8'd0;    #1000;
        duty = 8'd64;   #1000;
        duty = 8'd128;  #1000;
        duty = 8'd192;  #1000;
        duty = 8'd255;  #1000;

        // Disable PWM
        enable = 0;
        #200;
        $stop;
    end

endmodule
