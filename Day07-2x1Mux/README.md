# Day 07 – 2x1 Multiplexer (MUX) in Verilog

Today's design is a *2x1 Multiplexer*, implemented in three different Verilog modeling styles:
- Dataflow
- Behavioral
- Structural

## Objective

To implement and simulate a multiplexer that selects one of two input signals based on a selector line.

## MUX Logic

- *Inputs*: A, B, Sel
- *Output*: Y

### Logic Equation:
Y = (~Sel & A) | (Sel & B)

## Modeling Techniques

- *Dataflow*: Using assign and logic operators
- *Behavioral*: Using case inside always
- *Structural*: Using NOT, AND, and OR gates

## Test Cases

Simulated all combinations of inputs and selector to verify MUX behavior.

## Tools

- *EDA Playground*
- *Simulator*: Icarus Verilog
- *Waveform Viewer*: EPWave

## Files

- mux2x1_df.sv
- mux2x1_behave.sv
- mux2x1_struct.sv
- tb_mux2x1.sv
