# Day 24 – D Latch (Behavioral Modeling)

## Aim
To design and simulate a **D Latch** using Verilog HDL and verify its functionality with a testbench.

## Theory

A **D Latch (Data/Transparent Latch)** is a sequential circuit that stores 1-bit data.

* It has **Data (D)** and **Enable (EN)** inputs.
* When **EN = 1**, the output **Q** follows the input **D**.
* When **EN = 0**, the output **Q** holds its previous value.
* **Qbar** always represents the complement of **Q**.

### Truth Table

| EN | D | Q (Next State) | Qbar |
| -- | - | -------------- | ---- |
| 0  | X | Q (Hold)       | \~Q  |
| 1  | 0 | 0              | 1    |
| 1  | 1 | 1              | 0    |

## Expected Output (Waveform)

1. When **EN=1 → Q follows D**
2. When **EN=0 → Q holds previous value**
3. **Qbar = NOT(Q)** at all times

## Applications

* Temporary data storage
* Used in *registers* and *counters*
* Building block for *D flip-flops*
