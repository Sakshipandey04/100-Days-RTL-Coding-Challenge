## Day 10: 2-bit Comparator (Behavioral Modeling)

## Objective:

Design and simulate a 2-bit comparator that compares two 2-bit binary numbers (A and B), and outputs:

gt = 1 if A > B

lt = 1 if A < B

et = 1 if A == B

Only one output should be high at any time.


## 📄 Design Approach:

Behavioral Modeling was used, which describes the logic using if-else conditions inside an always block.
Behavioral modeling is closer to high-level programming and suitable for describing logic in terms of behavior.

## 📁 Files:

design.sv → Contains the comparator module

testbench.sv → Stimulates the design with different test cases


## 💻 Simulation Tool:

EDA Playground
Language: SystemVerilog
Simulator: Icarus Verilog


## 🔁 Logic:

always @ (A or B) begin
    if (A > B) begin
        gt = 1; lt = 0; et = 0;
    end else if (A < B) begin
        gt = 0; lt = 1; et = 0;
    end else begin
        gt = 0; lt = 0; et = 1;
    end
end


## 🧪 Test Cases Covered:

A	B	Output

00	00	et = 1
01	00	gt = 1
10	10	et = 1
11	01	gt = 1
00	11	lt = 1


## ✅ Output Observed:

Comparator worked correctly in all test cases.

Only one of gt, lt, or et was high at a time.


## 📚 Learning for the Day:

Understood Behavioral modeling syntax and its use cases.
Learned how to fix syntax and logic errors in testbench.
Practiced clean module-testbench separation.
