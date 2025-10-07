Here’s your clean, professional-style **README file** for **Day 66 — Circular Buffer (FIFO Variant)** 👇

---

## 🧠 **Day 66 — Circular Buffer (FIFO Variant)**

### 🏷️ **Project Title:** Circular Buffer Memory with Wrap-Around Addressing

---
## Day 66
### **Overview**

The **Circular Buffer** is a variation of the FIFO (First-In-First-Out) memory structure that efficiently reuses memory locations by implementing **wrap-around addressing**.
When the write or read pointer reaches the end of the buffer, it automatically wraps back to the beginning — forming a logical “ring.”

This type of memory is extensively used in **streaming data pipelines**, **real-time signal processing**, and **communication systems** to handle continuous data flow with minimal latency and no dynamic memory allocation.

---

### **Key Features**

* **8×8-bit or 16×8-bit memory size** (configurable).
* **Wrap-around read/write pointers** for circular addressing.
* **Full and Empty flags** to prevent overflow or underflow.
* **Synchronous operation** (single clock domain).
* **Efficient memory reuse** without shifting data.
* **Supports simultaneous read and write** (with flag protection).

---

###  **Inputs and Outputs**

| Signal     | Direction | Width | Description                    |
| ---------- | --------- | ----- | ------------------------------ |
| `clk`      | Input     | 1     | System clock                   |
| `rst`      | Input     | 1     | Active-high synchronous reset  |
| `write_en` | Input     | 1     | Write enable signal            |
| `read_en`  | Input     | 1     | Read enable signal             |
| `data_in`  | Input     | 8     | Data to be written into buffer |
| `data_out` | Output    | 8     | Data read from buffer          |
| `full`     | Output    | 1     | High when buffer is full       |
| `empty`    | Output    | 1     | High when buffer is empty      |

---

### **Working Principle**

1. **Write Operation:**

   * Data is written at the location pointed by `write_ptr`.
   * `write_ptr` increments after each write.
   * When `write_ptr` reaches the end, it wraps back to `0`.

2. **Read Operation:**

   * Data is read from the location pointed by `read_ptr`.
   * `read_ptr` increments after each read.
   * When `read_ptr` reaches the end, it wraps back to `0`.

3. **Full/Empty Conditions:**

   * **Full:** Occurs when `(write_ptr + 1) % DEPTH == read_ptr`.
   * **Empty:** Occurs when `write_ptr == read_ptr`.

---

### **Expected Simulation Behavior**

* After reset → buffer is **empty**.
* Writing fills buffer until `full` is asserted.
* Further writes are ignored until data is read.
* Reading removes data in order of entry.
* When both pointers reach the end, they wrap to 0.

---

### **Applications**

* Audio/Video streaming systems.
* UART and SPI data buffering.
* DMA controllers and data pipelines.
* Continuous sensor data storage.

---

###  **Learning Outcomes**

* Implementation of **wrap-around pointer logic**.
* Understanding **full/empty flag** generation.
* Efficient use of fixed memory size.
* Real-time data handling and synchronization.
