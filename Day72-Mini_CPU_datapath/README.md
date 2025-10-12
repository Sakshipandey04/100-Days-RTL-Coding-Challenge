# Day 72 – Mini CPU Datapath (ALU + Register File + MUX)

## **Project Overview**

This project implements a **mini CPU datapath** in Verilog by integrating a **parameterized ALU**, a **register file**, and a **MUX** to select operands.

The design demonstrates **basic instruction execution principles**, where an ALU operation can use either a **register value** or an **immediate value** as input. The **result can be written back to a register**, mimicking a simple CPU datapath.

---

## **Features**

* **Parameterized n-bit ALU** and **n-bit, n-register file**
* Two **read ports** and one **write port** for the register file
* **MUX selects** ALU operand B: either register value or immediate value
* **ALU operations supported**:

  * Addition, Subtraction, AND, OR, XOR, Shift Left, Shift Right, NOT
* Output: **ALU result** and **carry flag**
* Fully **reusable and scalable** for different widths and register counts

---

## **Module Interfaces**

### **mini_cpu_datapath.v**

```verilog
module mini_cpu_datapath #(
    parameter WIDTH = 8,
    parameter REG_COUNT = 8
)(
    input wire clk, rst,
    input wire write_en,
    input wire [$clog2(REG_COUNT)-1:0] write_addr,
    input wire [WIDTH-1:0] immediate_data,
    input wire [2:0] alu_sel,
    input wire mux_sel,
    input wire [$clog2(REG_COUNT)-1:0] read_addr1,
    input wire [$clog2(REG_COUNT)-1:0] read_addr2,
    output wire [WIDTH-1:0] alu_result,
    output wire carry_out
);
```

* **Inputs:**

  * `clk`, `rst` → clock and reset
  * `write_en` → enables writing to the register file
  * `write_addr` → register to write the result
  * `immediate_data` → immediate operand for ALU
  * `alu_sel` → selects ALU operation
  * `mux_sel` → selects operand B source (`0` = register, `1` = immediate)
  * `read_addr1`, `read_addr2` → registers to read

* **Outputs:**

  * `alu_result` → result of ALU operation
  * `carry_out` → carry flag for addition/subtraction

---

## **Usage / Testbench**

* The testbench instantiates the mini CPU datapath and tests:

  * Selecting **register or immediate operands**
  * Performing **ALU operations** like ADD, AND, OR
  * Writing results back to a register
* Example simulation steps:

```verilog
read_addr1 = 3'd0; read_addr2 = 3'd1; mux_sel = 0; alu_sel = 3'b000; // ADD reg0 + reg1
mux_sel = 1; immediate_data = 8'h03; alu_sel = 3'b000; // ADD with immediate
```

---

## **Goals Achieved**

1. Integrated **register file, ALU, and MUX** into a mini datapath
2. Learned **operand selection and data flow in CPU datapath**
3. Built a foundation for **instruction execution** in CPU design
