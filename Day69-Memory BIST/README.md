
##  **Day 69 — Memory BIST (Built-In Self-Test)**

### **Overview**

This project implements a **Memory BIST (Built-In Self-Test)** system in Verilog.
A BIST automatically verifies the integrity of memory hardware by writing test patterns, reading them back, and comparing the results — all controlled by an **FSM (Finite State Machine)**.

This type of circuit is widely used in **SoCs, microcontrollers, and FPGAs** to ensure memory reliability during power-up or manufacturing tests.

---

###  **Specifications**

| Parameter         | Description                                  |
| ----------------- | -------------------------------------------- |
| **Memory Type**   | 16 × 8-bit RAM                               |
| **Test Patterns** | Alternating 0xAA, 0x55 (checkerboard)        |
| **Operation**     | Write → Read → Compare → Pass/Fail           |
| **Control Logic** | FSM                                          |
| **Outputs**       | `done` (test complete), `pass` (test result) |
| **Reset**         | Clears FSM and memory                        |

---

### **Learning Objectives**

* Understand how **hardware self-testing** works.
* Implement **pattern generation and verification logic**.
* Learn how to integrate **FSM control** with **RAM operations**.
* Practice **synchronous design and status flag generation**.

---

### **Block Diagram (Conceptual)**

```
      +--------------------------------------+
      |              BIST FSM                |
      |--------------------------------------|
      |  Pattern Generator  →  RAM Write     |
      |  Address Counter     →  RAM Control  |
      |  Data Comparator     →  Pass/Fail    |
      +--------------------------------------+
                    ↑
                    |  Data from RAM
                    ↓
                +--------+
                | 16x8 RAM|
                +--------+
```

---

### **FSM States**

| State     | Description                              |
| --------- | ---------------------------------------- |
| **IDLE**  | Waits for start signal                   |
| **WRITE** | Writes pattern to all memory locations   |
| **READ**  | Reads and compares stored data           |
| **DONE**  | Signals completion with pass/fail result |

---

### **Expected Behavior**

1. FSM writes pattern `0xAA` to all memory addresses.
2. Reads back each address and verifies correctness.
3. Then repeats with `0x55`.
4. If all comparisons match → `pass = 1`, else `pass = 0`.
5. After both tests, FSM raises `done = 1`.

---

### **Test Flow**

| Step | Operation   | Expected Result         |
| ---- | ----------- | ----------------------- |
| 1    | Start = 1   | FSM starts test         |
| 2    | Write phase | Data written in pattern |
| 3    | Read phase  | Data checked            |
| 4    | Done = 1    | Indicates test complete |
| 5    | Pass = 1/0  | Shows test result       |

---

### **Applications**

* On-chip **memory health verification**.
* **Power-on self-test (POST)** routines in microcontrollers.
* **Manufacturing test automation** for embedded memory blocks.
* Used in **automotive and safety-critical** ICs.
