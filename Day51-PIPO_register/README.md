# Day 51 – Parallel In Parallel Out (PIPO) Register

##  Overview

A **PIPO register** stores parallel input data and makes it available at the output in parallel. Unlike SISO or PISO, no shifting occurs here — the data is simply stored and held until new data is loaded.

This design is parameterized so you can set the register width (`N`).

## 🛠 Features

* Parameterized width (default: 8 bits).
* Parallel load and parallel output.
* Active-high reset.
* Data hold when `load = 0`.

## I/O Ports

| Signal  | Direction | Width | Description                                        |
| ------- | --------- | ----- | -------------------------------------------------- |
| `clk`   | Input     | 1     | Clock signal                                       |
| `rst`   | Input     | 1     | Active-high reset                                  |
| `load`  | Input     | 1     | Load enable (parallel input stored on rising edge) |
| `p_data` | Input     | N     | Parallel input data                                |
| `q`     | Output    | N     | Parallel output data                               |

---

## Simulation Flow

1. Apply `rst = 1` → clears output to 0.
2. Set `p_data` and assert `load = 1` for one clock.
3. On rising edge of clock, `p_data` is captured into `q`.
4. When `load = 0`, `q` holds its previous value.


##  Example

For `N = 8`:

```
Cycle | load | pdata    | q
------+------|----------|--------
  1   |  1   | 10101010 | 10101010
  2   |  0   | 11111111 | 10101010
  3   |  1   | 11001100 | 11001100
```

## Applications

* Temporary data storage in processors.
* Buffering between functional units.
* Register files in CPUs.
* Holding intermediate results in digital systems.

