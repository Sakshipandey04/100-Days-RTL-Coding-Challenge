# Day 29 – T Flip-Flop (Toggle Flip-Flop)

## Overview
A *T Flip-Flop* (Toggle Flip-Flop) is a sequential logic circuit used widely in counters, frequency dividers, and digital systems.  
It is derived from the *JK Flip-Flop* by tying both inputs together.  

- When **T = 0** → The flip-flop **holds its state** (no change).  
- When **T = 1** → The flip-flop **toggles** its output (`Q` switches from 0 → 1 or 1 → 0) on every rising clock edge.  
- With **Reset = 1** → Output `Q` is cleared to `0` (asynchronous reset).  

## Working Principle
1. On every rising edge of the clock:  
   - If `reset = 1` → `Q` is forced to `0`.  
   - If `T = 0` → `Q` holds its previous state.  
   - If `T = 1` → `Q` toggles (`0 → 1` or `1 → 0`).  
2. Between clock edges, `Q` remains stable.  

## Truth Table

| Reset | Clock Edge ↑ | T | Q (Next State) |
|-------|--------------|---|----------------|
|   1   |      ↑       | X |       0        |
|   0   |      ↑       | 0 |   Q (no change)|
|   0   |      ↑       | 1 |   ~Q (toggle)  |
|   0   |   No ↑       | X | Q holds        |

---

## Timing Example
1. At `reset=1` → `Q=0`  
2. With `T=0` → `Q` stays constant across clock cycles  
3. With `T=1` → `Q` toggles at every rising clock edge  
4. Reset again → `Q=0` immediately  

---

##  Vivado Setup Instructions
1. Open **Xilinx Vivado** and create a **new project**.  
2. Add a **Verilog design source** → implement the T Flip-Flop module.  
3. Add a **simulation source** → implement the testbench.  
4. Click **Run Simulation → Behavioral Simulation**.  
5. Observe waveforms:  
   - `Q` toggles when `T=1`  
   - `Q` holds when `T=0`  
   - `Q` resets to `0` when `reset=1`
   - 
## Applications
- Binary Counters  
- Frequency Division  
- State Machines  
- Registers  

---

✨ This is part of my **100 Days of RTL Coding Challenge** – Day 29 ✅  
