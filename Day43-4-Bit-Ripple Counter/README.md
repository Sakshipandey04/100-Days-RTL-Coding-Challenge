# 4-Bit Ripple Counter

## Overview

On this day I implemented a **4-bit ripple counter** using flip-flops in Verilog. The counter increments its value on every clock pulse and cycles through all values from **0000 (0)** to **1111 (15)** in binary, then rolls over to 0000.

Ripple counters are called so because each flip-flop’s output acts as the clock for the next flip-flop, causing a ripple effect.

## Working Principle

* **Q0** (LSB) toggles on every rising edge of the clock.
* **Q1** toggles when **Q0** transitions from 1 → 0.
* **Q2** toggles when **Q1** transitions from 1 → 0.
* **Q3** toggles when **Q2** transitions from 1 → 0.

This produces a binary counting sequence.

## Simulation Waveform Explanation

The simulation output shows the values of **Q3 Q2 Q1 Q0** with respect to the clock:

| Clock Cycle | Output (Q3 Q2 Q1 Q0) | Decimal |
| ----------- | -------------------- | ------- |
| 0           | 0000                 | 0       |
| 1           | 0001                 | 1       |
| 2           | 0010                 | 2       |
| 3           | 0011                 | 3       |
| 4           | 0100                 | 4       |
| 5           | 0101                 | 5       |
| …           | …                    | …       |
| 15          | 1111                 | 15      |
| 16          | 0000 (rollover)      | 0       |
The waveform in simulation matches this counting sequence, confirming the counter works correctly.


## Applications

* Frequency division (each stage divides clock by 2).
* Digital clocks.
* Basic binary counters.
* Part of larger digital systems.
