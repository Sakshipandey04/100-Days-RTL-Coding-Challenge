# Day 06 – Full Subtractor using Verilog

Designed a 1-bit Full Subtractor in Verilog using:
- Dataflow Modeling
- Behavioral Modeling
- Structural Modeling

## Objective

To understand borrow propagation and logic simplification while implementing a Full Subtractor circuit.

## Full Subtractor Logic

- *Inputs*: A, B, Bin (Borrow-In)
- *Outputs*: Diff, Bout (Borrow-Out)

### Equations:
- Diff = A ⊕ B ⊕ Bin
- Bout = (~A & B) | (~(A ^ B) & Bin)

## Modeling Styles

-  Dataflow using assign
-  Behavioral using always @(*)
-  Structural using two Half Subtractors and OR gate

## Testbench

Simulated all 8 combinations of 3 input bits. Waveform dump used to verify output signals using EPWave.

## Tools

- *Simulator*: EDA Playground (Icarus Verilog)
- *Waveform*: EPWave (VCD Dump)
