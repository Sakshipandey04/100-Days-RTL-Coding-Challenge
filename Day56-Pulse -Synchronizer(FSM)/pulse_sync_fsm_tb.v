`timescale 1ns / 1ps
// tb_pulse_synchronizer.v
`timescale 1ns/1ps
module pulse_sync_fsm_tb;

reg clk, rst_n;
reg async_pulse;
wire sync_pulse;

// DUT
pulse_sync_fsm dut (
    .clk(clk),
    .rst_n(rst_n),
    .async_pulse(async_pulse),
    .sync_pulse(sync_pulse)
);

// Clock generation
initial clk = 0;
always #5 clk = ~clk; // 10ns period

initial begin
    // Initialize
    rst_n = 0;
    async_pulse = 0;
    #20;
    rst_n = 1;

    // Apply asynchronous pulses
    #15 async_pulse = 1;
    #10 async_pulse = 0;

    #30 async_pulse = 1;
    #5  async_pulse = 0;

    #20 async_pulse = 1;
    #15 async_pulse = 0;

    #50;
    $finish;
end

// Monitor outputs
initial begin
    $monitor("Time=%0t | async_pulse=%b | sync_pulse=%b", 
              $time, async_pulse, sync_pulse);
end

endmodule