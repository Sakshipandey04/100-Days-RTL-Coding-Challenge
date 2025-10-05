---

# DAy62- Dual-Port RAM (16 × 8-bit)

## **Project Overview**

This project implements a **dual-port synchronous RAM** in Verilog. It allows **simultaneous read and write operations** on independent ports, which is useful for high-performance systems such as CPU register files, FIFOs, and cache memories.

---

## **Objectives**

* Design a **dual-port RAM module** with separate read and write ports.
* Learn **concurrent memory access** in RTL.
* Reinforce **synchronous logic and multi-port memory handling**.
* Prepare for **advanced memory designs** in embedded systems and processors.

---

## **System Inputs**

* `clk` : System clock.
* `rst` : Synchronous reset.
* **Port A (write)**:

  * `wr_en_a` : Write enable.
  * `addr_a[3:0]` : Address to write.
  * `data_in_a[7:0]` : Data to write.
* **Port B (read)**:

  * `addr_b[3:0]` : Address to read.
  * `rd_en_b` : Read enable.

---

## **System Outputs**

* `data_out_b[7:0]` : Data read from Port B.

---

## **Behavior**

1. **Write Operation (Port A)**

   * On rising edge of `clk`, if `wr_en_a = 1`, store `data_in_a` into `memory[addr_a]`.

2. **Read Operation (Port B)**

   * On rising edge of `clk`, if `rd_en_b = 1`, output `data_out_b = memory[addr_b]`.

3. **Simultaneous Access**

   * Reading and writing can occur at the same time without conflicts.

---

## **Features**

* Dual-port memory with **independent read and write operations**.
* Fully **synchronous design**.
* Easy to **scale for larger memory sizes or multiple ports**.
* Suitable for **FPGA or ASIC implementation**.

---

## **Applications**

* CPU **register files** for simultaneous read/write.
* FIFO and circular buffer implementations.
* Cache memory designs.
* Embedded systems requiring **concurrent memory access**.

---

## **Future Enhancements**

* Extend to **more than two ports** (multi-port RAM).
* Add **write/read collision handling** for overlapping addresses.
* Integrate **asynchronous reset or initialization patterns**.
* Scale to **larger word width and depth** for advanced designs.

---

## **Conclusion**

This project demonstrates a practical **dual-port memory design** in Verilog. It teaches **concurrent memory access**, **synchronous read/write operations**, and is a stepping stone toward designing **complex memory systems** in real hardware applications.
