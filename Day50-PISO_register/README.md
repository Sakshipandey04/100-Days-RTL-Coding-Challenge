## Parallel In Serial Out (PISO) Register

## Overview

A **PISO register** takes parallel input data and shifts it out serially, one bit at a time, on each clock cycle.

* **Load mode** → parallel data is loaded into the register.
* **Shift mode** → data shifts out serially (LSB-first in this design).
* **Reset** → clears the register.

This design is parameterized so you can set the data width (`N`).

## Features

* Parameterized width (default: 8 bits).
* Supports `load` and `shift_en` controls.
* Active-high reset.
* Serial data output (`s_data`) bit-by-bit.

## I/O Ports

| Signal     | Direction | Width | Description                              |
| ---------- | --------- | ----- | ---------------------------------------- |
| `clk`      | Input     | 1     | Clock signal                             |
| `rst`      | Input     | 1     | Active-high reset                        |
| `load`     | Input     | 1     | Load enable (parallel input to register) |
| `shift_en` | Input     | 1     | Shift enable (shift out one bit/clk)     |
| `p_data`    | Input     | N     | Parallel data input                      |
| `s_data`    | Output    | 1     | Serial output bit                        |


##  Simulation Flow

1. Apply `rst = 1` → clears register.
2. Set `p_data` and assert `load = 1` for one clock.
3. Deassert `load`, assert `shift_en = 1`.
4. Bits of `p_data` will shift out serially on `s_data`.


## Example

For `pdata = 8'b11010110`, serial output (`s_data`) will be:

```
Cycle | s_data
------+------
1     | 0
2     | 1
3     | 1
4     | 0
5     | 1
6     | 0
7     | 1
8     | 1


