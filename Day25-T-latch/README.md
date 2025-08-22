# Day 25 – T Latch (Toggle Latch)

##  Overview
This project is part of my *100 Days RTL Coding Challenge*.  
On *Day 25, I designed and verified a **T Latch (Toggle Latch)* in Verilog.

A *T Latch* is a level-sensitive storage element:
- When clk = 1:
  - If T = 1, output Q toggles.
  - If T = 0, output Q holds its value.
- When clk = 0: latch is inactive, and Q retains its last value.

## Simulation Result
- When *clk = 1* and *T = 1*, output Q toggles between 0 and 1.  
- When *clk = 1* and *T = 0*, output Q holds its last value.  
- When *clk = 0*, latch is inactive and Q stays constant.  

The simulation waveforms confirmed the expected behavior of the *T latch*.
