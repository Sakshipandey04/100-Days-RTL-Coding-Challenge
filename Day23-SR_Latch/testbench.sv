`timescale 1ns/1ps
module tb_sr_latch;
    reg S, R;
    wire Q, Qbar;

    // DUT instantiation
    sr_latch uut (
        .S(S), 
        .R(R), 
        .Q(Q), 
        .Qbar(Qbar)
    );

    initial begin
        $dumpfile("sr_latch.vcd");
        $dumpvars(0, tb_sr_latch);

        // Apply test vectors
        S=0; R=0; #10;   // Hold
        S=1; R=0; #10;   // Set
        S=0; R=1; #10;   // Reset
        S=1; R=1; #10;   // Invalid

        $finish;
    end
endmodule
