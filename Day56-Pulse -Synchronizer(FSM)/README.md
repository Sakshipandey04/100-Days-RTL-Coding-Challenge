# Day 56 – FSM-based Pulse Synchronizer

## Problem Statement

Design a **Finite State Machine (FSM)** to **synchronize an asynchronous single-cycle pulse** into a synchronous clock domain.

* **Input Signals:**

  * `async_pulse` → an asynchronous, one-clock pulse from another domain
  * `clk` → system clock (synchronous domain)
  * `rst_n` → active-low reset

* **Output Signal:**

  * `sync_pulse` → a **single-clock synchronous pulse** generated in the `clk` domain corresponding to `async_pulse`

---

##  Objective

The goal is to **safely transfer a pulse** from an asynchronous domain to a synchronous domain without metastability.

* The output `sync_pulse` must **stay high for exactly one clock cycle** in the synchronous domain, even if the asynchronous input is very short.
* Use an FSM to detect the **rising edge** of the synchronized signal and produce a **clean one-cycle pulse**.

---

## FSM Design

We can implement this with **three main states**:

1. **IDLE**

   * Default state waiting for a pulse.
   * Output `sync_pulse = 0`.

2. **DETECT**

   * A pulse is detected at the input (after passing through a 2-flop synchronizer).
   * Output `sync_pulse = 1` for **one clock cycle**.

3. **WAIT**

   * Wait until the input pulse goes low to prevent multiple triggers from the same asynchronous pulse.
   * Once input is low → return to **IDLE**.

---

##  State Diagram

```text
       +-------+
       | IDLE  |
       |sync=0 |
       +-------+
           |
           | async_pulse rising
           v
       +--------+
       | DETECT |
       |sync=1  |
       +--------+
           |
           | next clk
           v
       +------+
       | WAIT |
       |sync=0|
       +------+
           |
           | async_pulse=0
           v
        +-----+
        | IDLE|
        +-----+
```

**Notes:**

* The asynchronous input first passes through **two flip-flops** to synchronize it with `clk` and reduce metastability risk.
* The FSM ensures that even a **short asynchronous pulse** results in a **single-cycle synchronous pulse**.

---

##  Example Sequence

| Cycle | async_pulse | sync_pulse | FSM State |
| ----- | ----------- | ---------- | --------- |
| 1     | 0           | 0          | IDLE      |
| 2     | 1           | 1          | DETECT    |
| 3     | 1           | 0          | WAIT      |
| 4     | 0           | 0          | IDLE      |


