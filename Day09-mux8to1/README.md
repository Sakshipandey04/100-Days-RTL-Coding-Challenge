## Day 09: RTL Coding Challenge

## 8x1 Multiplexer using Behavioral Modeling

## Objective:
To implement an 8-to-1 Multiplexer (MUX) using behavioral modeling in Verilog and verify its functionality with a testbench.

## Concepts Learned:

Behavioral modeling with case statement
Using reg for output inside always block
Syntax for 3-bit select lines
Writing a clean and modular testbench
Generating waveform files using $dumpfile and $dumpvars


## Design Module Summary:

Module: mux8x1_behavioral

module mux8x1_behavioral(
  input  [7:0] in,
  input  [2:0] sel,
  output reg out
);
  always @(*) begin
    case (sel)
      3'b000: out = in[0];
      3'b001: out = in[1];
      3'b010: out = in[2];
      3'b011: out = in[3];
      3'b100: out = in[4];
      3'b101: out = in[5];
      3'b110: out = in[6];
      3'b111: out = in[7];
    endcase
  end
endmodule


## Testbench Summary:

Module: tb_mux8x1

module tb_mux8x1;
  reg  [7:0] in;
  reg  [2:0] sel;
  wire out;

  mux8x1_behavioral uut (
    .in(in),
    .sel(sel),
    .out(out)
  );

  initial begin
    $dumpfile("mux8x1.vcd");
    $dumpvars(0, tb_mux8x1);

    in = 8'b10101010;
    sel = 3'b000; #5;
    sel = 3'b001; #5;
    sel = 3'b010; #5;
    sel = 3'b011; #5;
    sel = 3'b100; #5;
    sel = 3'b101; #5;
    sel = 3'b110; #5;
    sel = 3'b111; #5;

    $finish;
  end
endmodule

## Output:

Correct output observed for all combinations of sel


## Key Takeaways:

Always declare output as reg when assigning inside always block.
Ensure testbench values are properly spaced and timed.
Use waveform viewer (e.g., GTKWave) to debug and verify logic.
