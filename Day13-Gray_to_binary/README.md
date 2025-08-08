# Day 13 – Gray to Binary Code Converter

## Objective
Design a module that converts a 4-bit Gray code to its equivalent Binary representation using Behavioral modeling.

## Inputs and Outputs
- gray_in [3:0] : 4-bit Gray code input
- binary_out [3:0] : 4-bit Binary code output

## Working Logic
- Gray to Binary conversion is done by:
  - The MSB remains the same.
  - Each lower bit is calculated as XOR of the previous binary bit and current gray bit.

## Test Cases

| Gray Code | Binary |
|-----------|--------|
| 0000      | 0000   |
| 0001      | 0001   |
| 0011      | 0010   |
| 0010      | 0011   |
| 0110      | 0100   |
| 0111      | 0101   |
| 0101      | 0110   |
| 0100      | 0111   |
| 1100      | 1000   |
| 1101      | 1001   |

## Tools Used
- Verilog HDL
- EDA Playground / Vivado
- GTKWave or built-in waveform viewer
