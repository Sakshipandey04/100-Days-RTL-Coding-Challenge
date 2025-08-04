# Day 8: 4:1 Multiplexer (MUX)
Today’s goal was to design a 4:1 MUX using:
-  Dataflow modeling
-  Behavioral modeling
-  Structural modeling

###  Concept
A 4:1 multiplexer takes 4 data inputs and uses 2 select lines to choose one of them to pass to the output.

### 🛠Implementation
- *Dataflow*: Used conditional assignments with ternary operator.
- *Behavioral*: Used always block with case statement.
- *Structural*: Built using NOT, AND, and OR gates.

###  Testing
All models tested using a common Verilog testbench on EDA Playground.

## Observations:

Sel	Y (All Models)	Selected Input
00	A	A = 0
01	B	B = 1
10	C	C = 0
11	D	D = 1

All three models gave the same output, proving the design correctness.

## Tools Used:

EDA Playground
Verilog HDL
GTKWave for waveform viewing
