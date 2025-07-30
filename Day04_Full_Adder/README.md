# Day 04 – Full Adder using Verilog

In this task, I designed and simulated a *1-bit Full Adder* using three different modeling styles in Verilog:
- *Dataflow Modeling*
- *Behavioral Modeling*
- *Structural Modeling*

## Objective

To understand and implement the logic of a Full Adder using Verilog's modeling techniques, and simulate it using EDA Playground.

## Full Adder Logic

A Full Adder adds three 1-bit binary inputs:
- Inputs: A, B, Cin (carry-in)
- Outputs: Sum, Cout (carry-out)

### Equations:
- Sum  = A ⊕ B ⊕ Cin
- Cout = (A & B) | (B & Cin) | (Cin & A)

## Modeling Styles

### 1. Dataflow Modeling
```verilog
assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (B & Cin) | (Cin & A);

2. Behavioral Modeling

always @(*) begin
  Sum = A ^ B ^ Cin;
  Cout = (A & B) | (B & Cin) | (Cin & A);
end

 3. Structural Modeling

Built using two half adders and one OR gate.

# Testbench

Tested all 8 possible input combinations for 3-bit addition. Simulated on EDA Playground with dump.vcd for waveform analysis.


## Waveform Viewer

Used EPWave viewer to visualize outputs.

 ### Files

full_adder_df.v – Dataflow model

full_adder_behave.v – Behavioral model

full_adder_struct.v – Structural model

half_adder.v – Half adder module used in structural model

tb_full_adder.v – Common testbench

Waveform.png - Output

## Output Verified

All outputs were tested and verified via waveform simulation.


## Simulator Used

EDA Playground (Icarus Verilog + EPWave)
