##  **Day 68 — Stack Memory (LIFO)**

### **Overview**

This project implements an **8x8 Stack Memory** using Verilog HDL.
A **Stack** follows the **Last-In-First-Out (LIFO)** principle — the most recently added element is the first to be removed.
Stacks are widely used in **function call management**, **expression evaluation**, **recursion**, and **temporary data storage** in CPUs.

---

###  **Specifications**

| Feature        | Description                              |
| -------------- | ---------------------------------------- |
| **Type**       | LIFO (Stack Memory)                      |
| **Depth**      | 8 locations                              |
| **Width**      | 8 bits per location                      |
| **Operations** | Push, Pop                                |
| **Flags**      | Full, Empty                              |
| **Reset**      | Clears stack pointer and memory contents |
| **Clock**      | Synchronous operation                    |

---

###  **Learning Objectives**

* Understand stack-based memory design.
* Implement pointer-based data management.
* Handle **overflow** (Full) and **underflow** (Empty) conditions.
* Design stack control using sequential logic.

---

###  **Block Diagram (Conceptual)**

```
          +--------------------------+
          |        Stack (8x8)       |
          |--------------------------|
Push ---> | Data_in  ---> [SP + 1]   |
Pop  ---> | Data_out <--- [SP - 1]   |
          |--------------------------|
          | Full Flag | Empty Flag   |
          +--------------------------+
```

---

###  **FSM / Logic Description**

* **Push Operation**:
  Data is stored at the current stack pointer (`sp`), then `sp` increments.
* **Pop Operation**:
  Stack pointer decrements first, then data from that location is read to `data_out`.
* **Flags**:

  * `full` = 1 → Stack is full (`sp == DEPTH`)
  * `empty` = 1 → Stack is empty (`sp == 0`)

---

###  **Simulation Test Flow**

1. **Reset** the stack.
2. Perform **Push operations** (fill partially/full).
3. Perform **Pop operations** (retrieve data LIFO order).
4. Check **Full** and **Empty** flags.
5. Attempt overflow/underflow conditions.

---

### **Expected Output**

* The **last pushed data** appears first when popping.
* `full = 1` when 8 elements are stored.
* `empty = 1` when all elements are popped out.
* Proper functioning of push and pop sequencing.

---

### **Applications**

* CPU **call stack** and **return address storage**.
* **Expression evaluation** (postfix/prefix).
* Temporary storage in **compilers and interpreters**.
* Used in **recursive function** execution and **interrupt handling**.
---
