`timescale 1ns / 1ps

module pulse_sync_fsm(
    input  wire clk,
    input  wire rst_n,
    input  wire async_pulse,  // asynchronous single-cycle pulse
    output reg  sync_pulse    // one-clock synchronous pulse
);

// Two-stage synchronizer to reduce metastability
reg sync1, sync2;
reg prev_sync2;

always @(posedge clk) begin
    if (!rst_n) begin
        sync1 <= 1'b0;
        sync2 <= 1'b0;
        prev_sync2 <= 1'b0;
        sync_pulse <= 1'b0;
    end else begin
        // 2-flop synchronizer
        sync1 <= async_pulse;
        sync2 <= sync1;

        // Detect rising edge
        prev_sync2 <= sync2;
        sync_pulse <= sync2 & ~prev_sync2;
    end
end
endmodule
