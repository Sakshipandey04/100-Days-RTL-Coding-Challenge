# JK Flip-Flop (Day 27)

This project implements a **JK Flip-Flop** in Verilog with:
- Positive edge-triggered clock
- Active-low asynchronous **reset** (`rst_n`)
- Active-low asynchronous **preset** (`preset_n`)
- Outputs: `q` and `qn`

## Truth Table

| J | K | Q(next) | Description |
|---|---|---------|-------------|
| 0 | 0 | Q       | Hold (no change) |
| 0 | 1 | 0       | Reset |
| 1 | 0 | 1       | Set |
| 1 | 1 | ~Q      | Toggle |

- Reset has priority over preset if both asserted.


##  Simulation

Using **Icarus Verilog** and **GTKWave**:
