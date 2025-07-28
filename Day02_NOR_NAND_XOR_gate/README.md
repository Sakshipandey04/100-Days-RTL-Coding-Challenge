# Day 2 – NOR, XOR, NAND Gates

## ✅ Description

This day includes simulations for three fundamental logic gates:
- NOR Gate
- XOR Gate
- NAND Gate

Each gate has its own RTL module and testbench file. Simulations were done using EDA Playground, and waveform files (dump_*.vcd) are included.

---

### 1️⃣ NOR Gate
*Expression*: Y = ~(A | B)

| A | B | Y |
|---|---|---|
| 0 | 0 | 1 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 0 |

---

### 2️⃣ XOR Gate
*Expression*: Y = A ^ B

| A | B | Y |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

---

### 3️⃣ NAND Gate
*Expression*: Y = ~(A & B)

| A | B | Y |
|---|---|---|
| 0 | 0 | 1 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

---

## 🖥 Files

- design.sv, testbench.sv, 
- design.sv, testbench.sv, 
- design.sv, testbench.sv, 

✅ You can view the waveform using *GTKWave* or online tools.
