
# DAy 63- 16 × 8-bit Read-Only Memory (ROM) with FSM Access

## **Project Overview**

This project implements a **16 × 8-bit Read-Only Memory (ROM)** in Verilog. The ROM is preloaded with instructions or constants and is accessed sequentially using a **program counter (PC)** controlled by a **finite state machine (FSM)**. This design simulates a **mini instruction fetch unit** similar to a CPU’s fetch stage.

---

## **Objectives**

* Implement a **ROM module** in Verilog.
* Learn **preloading memory contents** at synthesis time.
* Combine **FSM + memory** for sequential access.
* Simulate a **mini instruction fetch mechanism** for educational purposes.

---

## **System Inputs**

* `clk` : System clock.
* `rst` : Synchronous reset to initialize FSM and PC.
* `start` : Signal to begin reading instructions sequentially.

---

## **System Outputs**

* `instr_out[7:0]` : Current instruction read from ROM.
* `done` : Goes high when all instructions have been read.

---

## **Behavior**

1. **FSM Operation**

   * `IDLE` → waits for `start` signal.
   * `FETCH` → reads instructions sequentially from ROM using the program counter.
   * `DONE` → indicates all instructions have been read.

2. **Program Counter (PC)**

   * 4-bit counter indexes the 16 memory locations.
   * Increments every clock cycle during the `FETCH` state.

3. **ROM Content**

   * Preloaded with instructions or constants at synthesis.
   * Read-only access, values cannot be modified during simulation.

---

## **Features**

* Preloaded ROM with **sequential access**.
* FSM-controlled instruction fetch.
* Fully **synthesizable for FPGA or ASIC**.
* Modular and scalable to larger ROM sizes or instruction widths.

---

## **Applications**

* Mini **CPU instruction fetch** simulation.
* Preloaded **lookup tables** for digital systems.
* Educational purposes for understanding **FSM + memory interaction**.

---

## **Future Enhancements**

* Expand ROM size (32, 64, or 256 words).
* Add **asynchronous or random access** capability.
* Combine with **RAM for hybrid memory systems**.
* Integrate with **a full mini-CPU design** for complete instruction execution.

---

Do you want me to do that?
