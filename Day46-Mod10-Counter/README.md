# Day 46 RTL Challenge – Mod-10 Counter

## Overview

This challenge implements a **Mod-10 synchronous counter** (also called a **decade counter**).
The counter counts from `0 → 9` and then resets back to `0`. Such counters are widely used in **digital clocks, BCD counters, and frequency dividers**.

## Working Principle

* The counter increments its value on every **positive clock edge**.
* A **synchronous reset** sets the counter to `0`.
* When the counter reaches `9` (decimal), the next clock pulse resets it back to `0`.
* This ensures that the counter cycles through **exactly 10 states** (`0–9`).

## Simulation Waveform Explanation

The expected output sequence for a **Mod-10 counter** is:

| Clock Cycle | Output (Decimal) | Binary (Q3 Q2 Q1 Q0) |
| ----------- | ---------------- | -------------------- |
| 0           | 0                | 0000                 |
| 1           | 1                | 0001                 |
| 2           | 2                | 0010                 |
| 3           | 3                | 0011                 |
| 4           | 4                | 0100                 |
| 5           | 5                | 0101                 |
| 6           | 6                | 0110                 |
| 7           | 7                | 0111                 |
| 8           | 8                | 1000                 |
| 9           | 9                | 1001                 |
| 10          | 0 (rollover)     | 0000                 |
| 11          | 1                | 0001                 |

The cycle repeats every 10 clock pulses.

##  Applications

* **Digital clocks** (seconds, minutes, hours).
* **Binary Coded Decimal (BCD) counters**.
* **Frequency division** (divide-by-10).
* **Timers and stopwatches**.
