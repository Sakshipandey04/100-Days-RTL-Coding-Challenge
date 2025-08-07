# Day 11 – 4-to-2 Priority Encoder

## Objective
Design and simulate a 4-to-2 priority encoder using behavioral modeling. The encoder outputs the binary index of the highest active input.

## Inputs and Outputs
- data_in [3:0] : Input bits
- encoded_out [1:0] : Output binary code of the highest-priority input
- valid : High if any input is active, else low

## Working
This priority encoder uses casez to match the first high bit from MSB to LSB:
- MSB (data_in[3]) has the highest priority.
- If multiple inputs are high, the highest one is encoded.
- valid = 0 if all inputs are 0.

## Test Cases

| data_in | encoded_out | valid |
|---------|-------------|--------|
| 0000    |     00      |   0    |
| 0001    |     00      |   1    |
| 0010    |     01      |   1    |
| 0100    |     10      |   1    |
| 1000    |     11      |   1    |
| 1111    |     11      |   1    |

## Tools
- Verilog HDL
- EDA Playground / Xilinx Vivado
- GTKWave for waveform visualization
