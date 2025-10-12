# Day 70 – 8-bit Parameterized ALU

## **Project Overview**

This project implements an **8-bit Arithmetic Logic Unit (ALU)** in Verilog, designed to perform basic arithmetic and logic operations. The ALU is **parameterized**, allowing easy scalability to any bit-width by changing a single parameter.

---

## **Features**

* **Parameterized width** (`WIDTH = 8` by default)
* Supports **8 ALU operations**:

  1. Addition (`A + B`)
  2. Subtraction (`A - B`)
  3. AND (`A & B`)
  4. OR (`A | B`)
  5. XOR (`A ^ B`)
  6. Shift Left (`A << 1`)
  7. Shift Right (`A >> 1`)
  8. NOT (`~A`)
* **CarryOut** flag for addition/subtraction
* Fully **reusable and scalable** for n-bit designs

---

## **Module Interface**

```verilog
module alu #(parameter WIDTH = 8)(
    input  [WIDTH-1:0] A, B,
    input  [2:0] ALU_Sel,
    output reg [WIDTH-1:0] ALU_Out,
    output reg CarryOut
);
```

* **Inputs:**

  * `A`, `B` → Operand inputs (WIDTH-bit)
  * `ALU_Sel` → 3-bit ALU operation selector

* **Outputs:**

  * `ALU_Out` → Result of the operation
  * `CarryOut` → Carry/borrow flag

---

## **Operation Table**

| ALU_Sel | Operation   | Example (A=0x0F, B=0x0A) | Output |
| ------- | ----------- | ------------------------ | ------ |
| 000     | Addition    | 15 + 10                  | 19     |
| 001     | Subtraction | 15 - 10                  | 05     |
| 010     | AND         | 0x0F & 0x0A              | 0A     |
| 011     | OR          | 0x0F | 0x0A              | 0F     |
| 100     | XOR         | 0x0F ^ 0x0A              | 05     |
| 101     | Shift Left  | 0x0F << 1                | 1E     |
| 110     | Shift Right | 0x0F >> 1                | 07     |
| 111     | NOT         | ~0x0F                    | F0     |

---

## **Testbench**

* The testbench instantiates the ALU and tests all operations.
* Example input: `A = 15, B = 10`
* Observes outputs and carry flag for correctness.

