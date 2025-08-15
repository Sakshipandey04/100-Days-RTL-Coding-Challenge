## Day 20 – 4-bit Parity Checker (Behavioral Modeling)

## Objective
Implement a circuit that verifies whether a received data word matches its parity bit in Even or Odd parity mode.

## Description
This design checks if the received parity bit matches the parity calculated from the data bits.

Even Mode (mode=0) → Total 1’s (data + parity bit) should be even.

Odd Mode (mode=1) → Total 1’s (data + parity bit) should be odd.

If mismatch → Error = 1
If match → Error = 0

## Tools Used

EDA Playground & Xilinx Vivado

## Files

parity_checker.sv → Design file

tb_parity_checker.sv → Testbench file

## Output
Verified correct parity checking for multiple test cases in both even and odd modes.
