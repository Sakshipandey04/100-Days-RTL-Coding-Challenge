module pwm_generator #(
    parameter WIDTH = 8              // Bit width for counter
)(
    input  wire clk,                 // System clock
    input  wire rst,                 // Active high synchronous reset
    input  wire enable,              // Enable PWM output
    input  wire [WIDTH-1:0] duty,    // Duty cycle control
    output reg pwm_out               // PWM output signal
);

    reg [WIDTH-1:0] counter;         // Counter register

    // Counter logic
    always @(posedge clk) begin
        if (rst)
            counter <= 0;
        else if (enable)
            counter <= counter + 1'b1;
        else
            counter <= counter;
    end

    // PWM output logic
    always @(posedge clk) begin
        if (rst)
            pwm_out <= 0;
        else if (enable)
            pwm_out <= (counter < duty);
        else
            pwm_out <= 0;
    end

endmodule