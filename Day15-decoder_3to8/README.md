## Day 15 – 3-to-8 Decoder (Verilog HDL)

Part of my 100 Days RTL Coding Challenge

## Project Overview

In this project, I implemented a 3-to-8 Decoder using Verilog HDL.
A decoder converts binary input signals into a one-hot output, activating only the corresponding output line.
This is useful in address decoding, memory selection, and digital logic design.

## Features

3-bit binary input

Enable signal to activate or deactivate the decoder

8-bit one-hot output

Testbench for verification


## Files Included

design.sv → Verilog code for the 3-to-8 Decoder

testbench.sv → Testbench to verify design functionality

decoder_3to8.vcd → Waveform output


## How It Works

Inputs:

in[2:0] → 3-bit binary input

en → Enable signal


Output:

out[7:0] → One-hot encoded output

When en = 1, the output corresponding to the binary input is set to 1, all others are 0.
When en = 0, all outputs are 0.


## Truth Table

Enable (en)	in[2]	in[1]	in[0]	Output (out[7:0])

0	X	X	X	00000000
1	0	0	0	00000001
1	0	0	1	00000010
1	0	1	0	00000100
1	0	1	1	00001000
1	1	0	0	00010000
1	1	0	1	00100000
1	1	1	0	01000000
1	1	1	1	10000000


## Simulation Output

Tool Used: EDA Playground

Waveform: Shows one-hot output change based on input values.

## How to Run

1. Copy the code into EDA Playground or your Verilog simulation tool.

2. Run simulation for the testbench file.

3. Open .png file to view waveforms.


## Learning Outcome

Strengthened understanding of decoders in digital logic.

Gained practice in SystemVerilog coding and testbench writing.

Learned how to use an enable signal in combinational logic.
