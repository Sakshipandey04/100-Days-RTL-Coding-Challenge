## **Day 64 — RAM Controller FSM**
---

###  **Overview**

This project implements a **RAM Controller** that uses a **Finite State Machine (FSM)** to automatically perform **write** and **read** operations on a simple 16×8 RAM module.
The FSM sequentially writes data into the memory, reads it back, and asserts a `done` signal when all operations are complete.
It’s a fundamental design often used in embedded systems for **memory initialization and verification**.

---

###  **Features**

* Synchronous 16x8 RAM block.
* FSM-based **write → read → done** sequence.
* **Automatic address counter** for sequential access.
* **Done flag** to indicate successful operation.
* Fully synthesizable design (FPGA/ASIC-friendly).

---

###  **FSM States**

| State Name | Description                                      |
| ---------- | ------------------------------------------------ |
| **IDLE**   | Waits for the `start` signal.                    |
| **WRITE**  | Writes data (0x01 → 0x10) sequentially into RAM. |
| **READ**   | Reads back each memory location in order.        |
| **DONE**   | Indicates operation completion with `done = 1`.  |

---

###  **Inputs and Outputs**

| Signal     | Direction | Description                            |
| ---------- | --------- | -------------------------------------- |
| `clk`      | Input     | Clock signal                           |
| `rst`      | Input     | Active-high reset                      |
| `start`    | Input     | Starts FSM operation                   |
| `data_out` | Output    | Data read from RAM                     |
| `done`     | Output    | High when FSM completes all operations |

---

### **Design Components**

1. **RAM Block (16×8):**
   Stores 8-bit data at 16 address locations.

2. **FSM Controller:**
   Controls write and read operations in sequence.

3. **Address Counter:**
   Keeps track of the current memory location.

4. **Data Generator:**
   Increments data value during the write cycle.

---

###  **Expected Simulation Behavior**

* After reset, FSM remains in **IDLE**.
* On `start = 1`, FSM moves to **WRITE**, storing incremental values (1, 2, 3, ...).
* After all 16 addresses are written, FSM transitions to **READ**, retrieving data back sequentially.
* Finally, FSM goes to **DONE**, and the `done` signal is asserted high.

---

### **Applications**

* RAM testing and diagnostics.
* Bootloader-style memory initialization.
* Educational FSM + memory practice project.
* Verification environment for memory-based designs.

---
