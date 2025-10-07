## **Day 65 — FIFO (First-In First-Out) Memory**

###  **Project Title:** Synchronous FIFO (First-In First-Out) Buffer

---

### **Overview**

This project implements a **Synchronous FIFO (First-In First-Out)** memory structure — one of the most widely used components in digital system design.
A FIFO allows data to be written and read in the same order it was received, ensuring **data flow consistency** between modules operating at different rates.

It uses **register-based storage**, **read/write pointers**, and **status flags** to manage queue operations.
The FIFO operates synchronously with a single clock, meaning all read and write actions occur on the same clock edge.

---

###  **Key Features**

* **8×8-bit FIFO** (8 memory locations, each 8-bit wide).
* **Push/Pop control** for enqueue and dequeue operations.
* **Full and Empty flags** for overflow/underflow detection.
* **Synchronous design** (single clock domain).
* **Circular addressing** using read/write pointers.
* Fully **synthesizable** for FPGA/ASIC implementation.

---

### **FIFO Operation**

| Operation    | Description                                |
| ------------ | ------------------------------------------ |
| **Push**     | Writes new data to FIFO (if not full)      |
| **Pop**      | Reads oldest data from FIFO (if not empty) |
| **Full**     | Asserted when FIFO is completely filled    |
| **Empty**    | Asserted when FIFO has no valid data       |
| **Data_out** | Holds output data after a pop operation    |

---

###  **Inputs and Outputs**

| Signal     | Direction | Width | Description                  |
| ---------- | --------- | ----- | ---------------------------- |
| `clk`      | Input     | 1     | System clock                 |
| `rst`      | Input     | 1     | Active-high reset            |
| `push`     | Input     | 1     | Push (enqueue) signal        |
| `pop`      | Input     | 1     | Pop (dequeue) signal         |
| `data_in`  | Input     | 8     | Data to be written into FIFO |
| `data_out` | Output    | 8     | Data read from FIFO          |
| `full`     | Output    | 1     | Indicates FIFO is full       |
| `empty`    | Output    | 1     | Indicates FIFO is empty      |

---

### **Internal Design Components**

* **Memory Array:** 8 registers of 8 bits each for storage.
* **Write Pointer (`wr_ptr`):** Tracks where to write next.
* **Read Pointer (`rd_ptr`):** Tracks where to read next.
* **Counter:** Tracks the number of stored elements for flag generation.

---

### **Expected Simulation Behavior**

1. After reset → FIFO is **empty**.
2. When data is **pushed**, FIFO stores values sequentially.
3. On **pop**, oldest data appears at `data_out`.
4. `full` is asserted when 8 entries are written.
5. `empty` is asserted when all data is popped.

---

### **Applications**

* UART transmit and receive buffers.
* Interfacing between high-speed and low-speed modules.
* Audio/video streaming systems.
* Hardware data flow management and pipelining.
