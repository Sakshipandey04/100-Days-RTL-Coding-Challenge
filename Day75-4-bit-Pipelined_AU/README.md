## **Day 75 — 4-Stage Pipelined Arithmetic Unit**

### **Overview**

On **Day 75**, I designed a **4-stage pipelined arithmetic unit** that performs **addition** and **multiplication** on 8-bit operands.
The main goal of this project is to understand how pipelining enhances **throughput** by overlapping multiple operations across different stages.

---

###  **Pipeline Stages**

| Stage  | Name        | Function                                            |
| :----- | :---------- | :-------------------------------------------------- |
| **S1** | Input Latch | Captures input operands and operation selection     |
| **S2** | Operation   | Performs both addition and multiplication           |
| **S3** | Selection   | Chooses between the results based on operation type |
| **S4** | Output      | Stores and outputs the final computed result        |

---

###  **Module Interface**

| Signal   | Direction     | Description                                |
| :------- | :------------ | :----------------------------------------- |
| `clk`    | Input         | System clock signal                        |
| `rst`    | Input         | Active-high reset signal                   |
| `a`, `b` | Input [7:0]   | 8-bit input operands                       |
| `op_sel` | Input         | Operation selector (0 = Add, 1 = Multiply) |
| `result` | Output [15:0] | 16-bit final computed result               |

---

### **Concept**

Pipelining allows the arithmetic unit to start processing new data every clock cycle while previous operations are still completing in later stages.
Once the pipeline is filled, a **new result is produced every clock cycle**, improving throughput without increasing clock frequency.

---

###  **Operation Example**

| Clock Cycle | Operand A | Operand B | Operation | Output (After 4 Cycles) |
| :---------- | :-------- | :-------- | :-------- | :---------------------- |
| 1           | 5         | 3         | Add       | 8                       |
| 2           | 10        | 20        | Add       | 30                      |
| 3           | 4         | 6         | Multiply  | 24                      |
| 4           | 3         | 7         | Multiply  | 21                      |

After 4 clock cycles (pipeline fill latency), results appear at every subsequent clock cycle.

---

###  **Key Learnings**

* Understood the **difference between latency and throughput** in pipelined systems.
* Gained hands-on experience with **register-based stage separation**.
* Observed how **pipelining boosts efficiency** in arithmetic and processor designs.
* Learned to manage **data flow synchronization** between stages.

---

### **Applications**

* CPU arithmetic logic units (ALUs)
* Signal processing hardware (DSPs)
* High-speed computation circuits
* Multi-operation processing cores

---
