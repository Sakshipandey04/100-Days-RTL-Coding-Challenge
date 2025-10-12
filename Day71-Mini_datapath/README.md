# Day 72 – Mini Datapath (ALU + MUX)

## **Project Overview**

This project implements a **mini datapath module** in Verilog that combines a **parameterized ALU** and a **MUX** to select operands dynamically. It serves as a fundamental building block for **CPU datapath design**.

The datapath allows selection between a **register value** or an **immediate value** as input to the ALU, performing arithmetic and logic operations.

---

## **Features**

* Parameterized **n-bit ALU** and **MUX**
* **ALU operations supported:**

  * Addition, Subtraction, AND, OR, XOR, Shift Left, Shift Right, NOT
* **MUX selects operand B** for ALU from:

  * `reg_data` → register value
  * `immediate_data` → immediate value
* Output: `result` from ALU and `carry_out` flag
* Fully **reusable and scalable** for different widths

---

## **Module Interface**

```verilog
module mini_datapath #(
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] reg_data,
    input  [WIDTH-1:0] immediate_data,
    input  [2:0] alu_sel,
    input  mux_sel,
    input  [WIDTH-1:0] alu_in_a,
    output [WIDTH-1:0] result,
    output carry_out
);
```

* **Inputs:**

  * `reg_data` → data from a register
  * `immediate_data` → immediate value
  * `alu_in_a` → first ALU operand
  * `alu_sel` → selects ALU operation
  * `mux_sel` → selects ALU operand B source

* **Outputs:**

  * `result` → ALU result
  * `carry_out` → carry/borrow flag for addition/subtraction

---

## **Usage / Testbench**

* The testbench instantiates the mini datapath and tests multiple scenarios:

  * Selecting `reg_data` or `immediate_data`
  * Performing ALU operations like ADD, AND, OR, NOT
* Example:

  ```verilog
  reg_data = 8'h0F; immediate_data = 8'h03; alu_in_a = 8'h05;
  mux_sel = 0; alu_sel = 3'b000; // ADD using reg_data
  mux_sel = 1; alu_sel = 3'b000; // ADD using immediate_data
  ```

---

## **Goals Achieved**

1. Learned **operand selection using MUX**
2. Practiced **parameterized module integration**
3. Built a **small datapath component**, preparing for full CPU datapath design
