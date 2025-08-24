## D Flip-Flop (Day 28)

A *D Flip-Flop (Data or Delay Flip-Flop)* is a sequential logic circuit that captures the value of the input `D` at the rising edge of the clock (`clk`) and outputs it on `Q`.  

It is widely used for:
- Data storage (1-bit memory cell)
- Registers
- Counters
- Finite State Machines (FSMs)
- Pipeline stages in processors

## Working Principle
- When `reset = 1` → Output `Q` is cleared to `0` (regardless of clock or data).  
- When `reset = 0` and on every **positive edge** of the clock → Output `Q` takes the value of input `D`.  
- Between clock edges → Output `Q` holds its last value.

## Truth Table

| Reset | Clock Edge ↑ | D | Q (Next State) |
|-------|--------------|---|----------------|
|   1   |      ↑       | X |       0        |
|   0   |      ↑       | 0 |       0        |
|   0   |      ↑       | 1 |       1        |
|   0   |   No ↑       | X |   Q holds      |

- **Reset = 1** → Forces `Q = 0` immediately (asynchronous).  
- **Reset = 0** → `Q` follows `D` only at the rising clock edge.  
- **No clock edge** → No change, output retains last state.
- 

### ⏱️ Timing Behavior (Example)

1. At `reset=1` → `Q=0`  
2. On next rising `clk` edge, if `D=1` → `Q=1`  
3. On following rising `clk` edge, if `D=0` → `Q=0`  
4. If `reset=1` asserted again at any time → `Q=0` immediately
