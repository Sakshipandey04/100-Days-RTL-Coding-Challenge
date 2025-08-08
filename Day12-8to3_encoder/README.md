# Day 12 – 8-to-3 Encoder

## Objective
Design and simulate an 8-to-3 encoder using behavioral modeling. The encoder converts the position of the highest active bit into a 3-bit binary output.

## Inputs and Outputs
- data_in [7:0] : 8-bit input
- encoded_out [2:0] : 3-bit binary encoded output
- valid : Flag indicating if any input bit is high

## Working
- The encoder prioritizes the MSB.
- If multiple bits are set, the position of the *highest (leftmost)* active bit is encoded.
- If none are set, valid = 0.

## Sample Test Cases

| data_in    | encoded_out | valid |
|------------|-------------|--------|
| 00000000   | 000         |   0    |
| 00000001   | 000         |   1    |
| 00000010   | 001         |   1    |
| 00000100   | 010         |   1    |
| 00001000   | 011         |   1    |
| 00010000   | 100         |   1    |
| 00100000   | 101         |   1    |
| 01000000   | 110         |   1    |
| 10000000   | 111         |   1    |

## Tools
- Verilog HDL
- GTKWave / Vivado / EDA Playground
- Icarus Verilog for simulation
