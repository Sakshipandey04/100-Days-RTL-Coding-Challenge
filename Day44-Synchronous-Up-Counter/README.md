# 4-bit Synchronous Up Counter

## Overview

This challenge is about designing a **4-bit synchronous up counter**.
Unlike the ripple counter (asynchronous), the synchronous counter updates **all output bits at the same time** on each clock pulse, since every flip-flop is triggered by the same clock.

## Working Principle

* The counter increments its value at every **positive clock edge**.
* A **synchronous reset** sets the counter output to `0000`.
* After reaching `1111` (decimal 15), the counter rolls over to `0000`.

## Simulation Waveform Explanation

The output sequence follows binary counting:

| Clock Cycle | Output (Q3 Q2 Q1 Q0) | Decimal |
| ----------- | -------------------- | ------- |
| 0           | 0000                 | 0       |
| 1           | 0001                 | 1       |
| 2           | 0010                 | 2       |
| 3           | 0011                 | 3       |
| 4           | 0100                 | 4       |
| …           | …                    | …       |
| 15          | 1111                 | 15      |
| 16          | 0000 (rollover)      | 0       |

Unlike ripple counters, all bits switch **simultaneously** with the clock edge (no ripple delay).
