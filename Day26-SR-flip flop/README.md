# Day 26 – SR Flip-Flop

## Overview
This project is part of my *100 Days RTL Coding Challenge*.  
On *Day 26, I implemented and verified an **SR Flip-Flop* in Verilog.

An *SR Flip-Flop* is an *edge-triggered sequential circuit* with two inputs:
- *S (Set):* Forces the output Q to 1.  
- *R (Reset):* Forces the output Q to 0.  
- *S = 0, R = 0 →* Output holds its previous state.  
- *S = 1, R = 1 →* Invalid condition (both set and reset active).  

## Truth Table

| Clock Edge | S | R | Q (Next State) |
|------------|---|---|----------------|
| ↑          | 0 | 0 | Hold (No Change) |
| ↑          | 0 | 1 | 0 (Reset) |
| ↑          | 1 | 0 | 1 (Set) |
| ↑          | 1 | 1 | Invalid (X) |

##  Simulation Result
- At each *positive clock edge*, the SR flip-flop updates its output.  
- S=1, R=0 → Output is set to 1.  
- S=0, R=1 → Output is reset to 0.  
- S=0, R=0 → Output holds its previous state.  
- S=1, R=1 → Invalid state (Q becomes undefined).  

 The simulation waveforms confirmed the expected theoretical behavior.  
