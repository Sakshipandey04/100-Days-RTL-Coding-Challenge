
##  **Day 67 — Register File**

### **Project Title:** 8×8 Register File with Multi-Read/Write Ports

---

### **Overview**

A **Register File** is a small, fast memory used in **CPU architectures** to store temporary data, operands, and results.
It allows **simultaneous multi-read and single/multi-write operations**, making it ideal for high-speed processing pipelines.

In this project, we implement an **8×8-bit register file**:

* **8 registers** each storing **8-bit data**.
* **2 read ports** for simultaneous reads.
* **1 write port** controlled by a write enable signal.

---

### **Key Features**

* **8×8-bit storage** (8 registers × 8 bits).
* **Two read ports** for concurrent reading.
* **Single write port** with write enable.
* **Synchronous write**; asynchronous read (or optionally synchronous).
* **Synchronous reset** to initialize all registers to 0.

---

### **Inputs and Outputs**

| Signal   | Direction | Width | Description                   |
| -------- | --------- | ----- | ----------------------------- |
| `clk`    | Input     | 1     | System clock                  |
| `rst`    | Input     | 1     | Active-high synchronous reset |
| `we`     | Input     | 1     | Write enable                  |
| `waddr`  | Input     | 3     | Write address (0–7)           |
| `raddr1` | Input     | 3     | Read port 1 address           |
| `raddr2` | Input     | 3     | Read port 2 address           |
| `wdata`  | Input     | 8     | Data to write                 |
| `rdata1` | Output    | 8     | Data from read port 1         |
| `rdata2` | Output    | 8     | Data from read port 2         |

---

### **Working Principle**

1. **Write Operation:**

   * When `we=1`, `wdata` is written to the register at `waddr` on the rising edge of `clk`.

2. **Read Operation:**

   * `rdata1` outputs the contents of the register at `raddr1`.
   * `rdata2` outputs the contents of the register at `raddr2`.
   * Reads are typically asynchronous, allowing immediate access without waiting for a clock edge.

3. **Reset Operation:**

   * On `rst=1`, all registers are cleared to `0`.

---

### **Expected Simulation Behavior**

* Reset clears all 8 registers → all read ports output `0`.
* Writing to a register updates the data at that address.
* Simultaneous reads return correct data from both read ports.
* Write occurs only when `we=1`.

---

### **Applications**

* CPU general-purpose register storage.
* Pipeline register stages in processors.
* Temporary storage for arithmetic/logical operations.
* Multi-port fast memory in FPGA designs.
