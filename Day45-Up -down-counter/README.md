## 4-bit Synchronous Up/Down Counter

## Overview

This challenge focuses on designing a **4-bit synchronous up/down counter**.
Unlike a normal up counter, this counter can **count upward or downward** depending on the value of a control input.

## Working Principle

* The counter operates on the **positive clock edge**.
* A **synchronous reset** initializes the counter to `0000`.
* **Control signal (`up_down`)**:

  * `1 →` counter increments (up counting).
  * `0 →` counter decrements (down counting).
* The counter rolls over after reaching its maximum (`1111 → 0000` in up mode) or minimum (`0000 → 1111` in down mode).

## Simulation Waveform Explanation

The waveform shows two modes:

### Up Counting (up\_down = 1)

| Clock Cycle | Output (Q3 Q2 Q1 Q0) | Decimal |
| ----------- | -------------------- | ------- |
| 0           | 0000                 | 0       |
| 1           | 0001                 | 1       |
| 2           | 0010                 | 2       |
| …           | …                    | …       |
| 15          | 1111                 | 15      |
| 16          | 0000 (rollover)      | 0       |

### Down Counting (up\_down = 0)

| Clock Cycle | Output (Q3 Q2 Q1 Q0) | Decimal |
| ----------- | -------------------- | ------- |
| 0           | 1111                 | 15      |
| 1           | 1110                 | 14      |
| 2           | 1101                 | 13      |
| …           | …                    | …       |
| 15          | 0000                 | 0       |
| 16          | 1111 (rollover)      | 15      |

The counter switches smoothly between **up** and **down** modes based on the control input.

## Applications

* Digital clocks with forward/reverse time adjustment.
* Elevators (floor counting up or down).
* Robotics movement counters.
* Frequency dividers with bidirectional control.
