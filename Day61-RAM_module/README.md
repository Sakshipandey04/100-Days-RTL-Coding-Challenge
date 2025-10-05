# Day61 Synchronous RAM (8-bit × 16-word)

## **Project Overview**

This project implements a **simple synchronous RAM module** in Verilog. The RAM has **16 memory locations**, each **8 bits wide**, and supports **read and write operations**. It is a foundational RTL design suitable for FPGA or ASIC implementation.

---

## **Objectives**

* Design a **synchronous RAM module** with read/write functionality.
* Learn **memory array modeling** in Verilog.
* Reinforce understanding of **clocked processes and data storage**.
* Prepare for **complex memory-based designs** such as FIFOs, register files, and caches.

---

## **System Inputs**

* `clk` : System clock for synchronous operations.
* `rst` : Synchronous reset (optional) to initialize memory.
* `wr_en` : Write enable signal (1 = write, 0 = read).
* `addr[3:0]` : 4-bit address to select one of the 16 memory locations.
* `data_in[7:0]` : 8-bit data to be written into memory.

---

## **System Outputs**

* `data_out[7:0]` : 8-bit data read from the memory at the specified address.

---

## **Behavior**

1. **Write Operation**:

   * On the rising edge of `clk`, if `wr_en = 1`, the module stores `data_in` into `memory[addr]`.

2. **Read Operation**:

   * On the rising edge of `clk`, `data_out` is updated with the value stored at `memory[addr]`.

3. **Reset**:

   * Optional synchronous reset initializes all memory locations to 0.

---

## **Features**

* Simple **synchronous RAM design**.
* Separate **read and write capability**.
* Can be easily **scaled** to larger memory sizes.
* Fully **RTL-synthesizable** for FPGA or ASIC.

---

## **Applications**

* Embedded system designs requiring **small memory storage**.
* Register files in CPU architectures.
* FIFO buffers or cache memory implementations.
* Educational purposes for learning **memory design in Verilog**.

---

## **Future Enhancements**

* Expand to **larger memory depth** (32, 64, or 256 words).
* Add **asynchronous read capability**.
* Include **dual-port access** for simultaneous read/write operations.
* Integrate **write protection or memory initialization patterns**.

---

## **Conclusion**

This project provides a **simple and practical introduction** to memory design in RTL. It demonstrates the fundamentals of **synchronous read/write operations**, **clocked processes**, and **memory array handling** in Verilog, forming the foundation for more complex memory systems.


Do you want me to create that version?
