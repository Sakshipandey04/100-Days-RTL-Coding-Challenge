# Day 57 – 3-bit Password Lock FSM

## Problem Statement

Design a **Finite State Machine (FSM)** that unlocks when the correct **3-bit password** is entered serially.

* **Input Signals:**

  * `clk` → system clock
  * `rst` → active-low reset
  * `enter` → pulse to sample input bit
  * `inbit` → serial input bit (LSB-first)

* **Output Signals:**

  * `unlock` → one-clock pulse when the password is correctly entered
  * `error` → one-clock pulse if a wrong bit is entered

* **Password:** `3'b101` (LSB-first sequence: 1 → 0 → 1)

---

## Objective

* Track the **number of consecutive correct bits** entered.
* Produce `unlock` when **all 3 bits match**.
* Produce `error` if **any bit does not match**, then reset FSM to the start state.
* Allow a new attempt after an `error` or `unlock`.

---

##  FSM Design

### States

| State | Meaning                   |
| ----- | ------------------------- |
| P0    | No bits matched           |
| P1    | First bit correct         |
| P2    | First two bits correct    |
| P3    | Password matched (unlock) |

### State Transitions

* **P0 → P1** if `inbit=1`
* **P1 → P2** if `inbit=0`
* **P2 → P3** if `inbit=1` → output `unlock=1`
* Any wrong bit → go to **P0** → output `error=1`

---

## State Diagram

```text
       +----+
       | P0 |  <-- start / reset
       +----+
        | 1
        v
       +----+
       | P1 |
       +----+
        | 0
        v
       +----+
       | P2 |
       +----+
        | 1
        v
       +----+
       | P3 |  <-- unlock
       +----+
        |
       reset to P0 after unlock

Wrong bit at any state → P0 (error)
```

---

## Example Sequence

| Step | Input Bit | FSM State | Output                       |
| ---- | --------- | --------- | ---------------------------- |
| 1    | 1         | P1        | unlock=0,error=0             |
| 2    | 0         | P2        | unlock=0,error=0             |
| 3    | 1         | P3        | unlock=1,error=0             |
| 4    | 1         | P1        | unlock=0,error=1 (wrong bit) |

---

