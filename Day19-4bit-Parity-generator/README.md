## Day 19 – 4-bit Even and Odd Parity Generator (Behavioral Modeling)

## Objective
Design a circuit to generate even and odd parity bits for a 4-bit input data word.

## Description
Parity bits are widely used in digital communication systems for error detection.

Even Parity: The total number of 1’s (data + parity bit) is even.

Odd Parity: The total number of 1’s (data + parity bit) is odd.

This design uses behavioral modeling in Verilog and generates both even and odd parity bits for a given 4-bit input.

## Tools Used

EDA Playground and Xilinx Vivado

## Files

parity_generator.sv → Design file

tb_parity_generator.sv → Testbench file


## Output
Simulation verifies the correct generation of both even and odd parity bits for multiple test inputs.
