# Day 47 RTL Challenge – 4-bit Johnson Counter

## Overview

This challenge implements a **4-bit Johnson Counter**, which is a variation of the ring counter.
Unlike a normal ring counter where a single `1` circulates, in a Johnson counter the inverted output of the last flip-flop is fed back to the first.
This doubles the number of unique states compared to a ring counter.


## Working Principle

* The Johnson counter uses a shift register with feedback.
* At each **clock pulse**, the bits shift right, and the inverted output of the last flip-flop enters the first.
* For a 4-bit counter, it produces **8 unique states** before repeating.
* Initial state (after reset) is usually `0000`.

---

## 🖥 Simulation Waveform Explanation

The expected sequence for a 4-bit Johnson Counter is:

| Clock Cycle | Output (Q3 Q2 Q1 Q0) | Decimal Equivalent |
| ----------- | -------------------- | ------------------ |
| 0           | 0000                 | 0                  |
| 1           | 1000                 | 8                  |
| 2           | 1100                 | 12                 |
| 3           | 1110                 | 14                 |
| 4           | 1111                 | 15                 |
| 5           | 0111                 | 7                  |
| 6           | 0011                 | 3                  |
| 7           | 0001                 | 1                  |
| 8           | 0000 (repeat)        | 0                  |

The counter generates **2 × n states** (for `n=4`, it gives 8 states).

## Applications

* **Pattern generation**.
* **Digital-to-Analog Converters (DACs)**.
* **State machines**.
* **Light chasing / LED effects**.
