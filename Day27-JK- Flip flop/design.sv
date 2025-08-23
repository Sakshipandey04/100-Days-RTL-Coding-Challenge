`timescale 1ns/1ps


module jk_ff (
    input  wire clk,       // clock
    input  wire rst_n,     // asynchronous reset (active-low)
    input  wire preset_n,  // asynchronous preset (active-low)
    input  wire j, k,
    output reg  q,
    output wire qn
);


    always @(posedge clk or negedge rst_n or negedge preset_n) begin
        if (!rst_n)
            q <= 1'b0;               // reset
        else if (!preset_n)
            q <= 1'b1;               // preset
        else begin
            case ({j,k})
                2'b00: q <= q;       // hold
                2'b01: q <= 1'b0;    // reset
                2'b10: q <= 1'b1;    // set
                2'b11: q <= ~q;      // toggle
            endcase
        end
    end

    assign qn = ~q;

endmodule
