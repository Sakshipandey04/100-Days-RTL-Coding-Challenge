`timescale 1ns/1ps

module tb_bcd_to_7seg;
  reg  [3:0] bcd_in;
  wire [6:0] seg_out;

  bcd_to_7seg uut (.bcd_in(bcd_in), .seg_out(seg_out));

    initial begin
        $dumpfile("bcd_to_7seg.vcd");
        $dumpvars(0, tb_bcd_to_7seg);
        $display("Time | BCD  | seg[a..g]");
        $display("------------------------");

        for (integer i = 0; i < 16; i = i + 1) begin
            bcd_in = i;
            #10;
          $display("%4dns | %b (%0d) | %b", $time, bcd_in, bcd_in, seg_out);
        end

        $finish;
    end
endmodule
