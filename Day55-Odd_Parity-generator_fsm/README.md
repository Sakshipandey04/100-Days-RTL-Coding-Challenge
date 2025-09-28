

# Day 55 – Odd Parity Generator FSM

##  Problem Statement

Design a **Finite State Machine (FSM)** that generates an **odd parity bit** for a stream of serial input data.

* **Input Signals**:

  * `din` → serial input bit
  * `valid` → indicates when `din` is valid
  * `load` → resets parity (start of new frame)
  * `clk` → system clock
  * `rst` → active-low reset

* **Output Signal**:

  * `parity` → current parity (1 if odd number of 1’s so far)

---

## Objective

The FSM must keep track of the **number of 1’s** seen so far:

* If the count is **even**, `parity = 0`.
* If the count is **odd**, `parity = 1`.

Whenever a new input bit arrives (`valid=1`):

* If `din=1` → toggle the parity state.
* If `din=0` → remain in the same parity state.

---

## FSM Design

This machine has **two states**:

1. **Even State** (parity = 0)

   * Represents an even number of 1’s received.

2. **Odd State** (parity = 1)

   * Represents an odd number of 1’s received.

**Transitions:**

* From **Even → Odd** if `din=1 & valid=1`
* From **Odd → Even** if `din=1 & valid=1`
* Stay in same state if `din=0`
* From any state, if `load=1`, return to **Even**

---

## State Diagram

```text
         +--------------------------+
         |                          |
         v                          |
   +-------------+   din=1    +------------+
   |  EVEN       | ---------->|      ODD   |
   | parity = 0  |            | parity = 1 |
   +----------+<-----------+---------+
         ^        din=1        |
         |                     |
         +---------------------+
              din=0 (stay)
```

**Notes:**

* `din=0` → remain in the same state
* `din=1` → toggle state
* `load=1` → force to **EVEN state**

---

##  Example Sequence

Input bits: `1, 0, 1, 1`

| Step | Input | Parity State | Output `parity` |
| ---- | ----- | ------------ | ------------    |
| 1    | 1     | Odd          | 1               |
| 2    | 0     | Odd          | 1               |
| 3    | 1     | Even         | 0               |
| 4    | 1     | Odd          | 1               |
