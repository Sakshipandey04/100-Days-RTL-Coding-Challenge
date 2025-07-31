# ➖ Day 05 – Half Subtractor using Verilog
Today’s focus is on designing and simulating a *Half Subtractor* using all three primary Verilog modeling styles:
- Dataflow
- Behavioral
- Structural

## Objective

To understand how subtraction works at the gate level and simulate it through Verilog HDL using various modeling techniques.
## ⚙ Logic Summary

- *Inputs*: A, B
- *Outputs*: Difference, Borrow

### Equations:
- Difference = A ⊕ B
- Borrow = ~A & B

## Modeling Types Covered

- ✅ *Dataflow*: assign statements
- ✅ *Behavioral*: always @(*)
- ✅ *Structural*: using logic gates (not, xor, and)

## Test Cases

Tested all input combinations:
- A=0, B=0
- A=0, B=1
- A=1, B=0
- A=1, B=1

Waveform verified using EDA Playground.

## 📈 Simulation Tool

- *EDA Playground*  
  Simulator: Icarus Verilog  
  Waveform: EPWave (dump.vcd file)

## Files

- dataflow_modeling.sv
- behvaioral_modeling.sv
- structural_modeling.sv
- tb_half_subtractor.sv
- output_waveform.png

## Learning Outcome

- Learned the subtractor logic design.
- Strengthened modeling techniques.
- Practiced signal debugging using waveform viewer.
