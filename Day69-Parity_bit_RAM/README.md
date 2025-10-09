## **Day69 — Parity Bit RAM**

### **Overview**

This project implements a **RAM with parity bit** for error detection. Each 8-bit memory word has **an extra parity bit** (even parity).

* On **write**: parity is calculated and stored.
* On **read**: parity is checked. If a mismatch occurs, an **error flag** is raised.

This is a basic **error-detection memory** design commonly used in **embedded systems, communication, and safety-critical applications**.

---

### **Specifications**

| Parameter   | Description                                        |
| ----------- | -------------------------------------------------- |
| Memory Size | 16 × 8-bit data + 1 parity bit                     |
| Parity Type | Even parity                                        |
| Inputs      | clk, rst, write_enable, address[3:0], data_in[7:0] |
| Outputs     | data_out[7:0], parity_error                        |
| Operation   | Write data + parity, Read + check parity           |
| Reset       | Clears memory and flags                            |

---

### **Learning Objectives**

* Understand **parity generation and checking**.
* Integrate **error detection logic** with RAM.
* Practice **synchronous memory read/write design**.
* Learn **status flag handling** for memory errors.

---

### **Block Diagram (Conceptual)**

```
      +-------------------+
      |     Parity RAM     |
      |-------------------|
Data ->| Write + Parity    |
Addr ->| Read + ParityChk  |-> Parity Error
WE   ->|                   |
CLK  ->|                   |
RST  ->|                   |-> Data Out
      +-------------------+
```

---

### **FSM/Operation Flow**

1. **Write Phase**: When `write_enable = 1`

   * Store `data_in` at memory[address]
   * Compute even parity and store
2. **Read Phase**: When `write_enable = 0`

   * Output `data_out`
   * Check parity; if mismatch → `parity_error = 1`
3. **Reset**: Clear memory and flags

---
