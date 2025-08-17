## Day 22 – Excess-3 to BCD Converter

## Problem Statement

Design and implement a Excess-3 to BCD Converter in Verilog using Behavioral Modeling.
This circuit converts a 4-bit Excess-3 coded input back into its BCD (Binary-Coded Decimal) equivalent.

## Approach

Excess-3 to BCD conversion is achieved by subtracting 3 (0011) from the input.
Only inputs from 0011 (3) to 1100 (12) are valid in Excess-3 representation.
Invalid inputs are marked as XXXX.


## Expected Output

Excess-3 Input	BCD Output

0011 (3)	0000 (0)
0100 (4)	0001 (1)
0101 (5)	0010 (2)
1000 (8)	0101 (5)
1100 (12)	1001 (9)
0010 (2)	XXXX (invalid)

## Learning Outcome

Learned how to reverse encode Excess-3 to BCD.

Practiced arithmetic combinational logic design.

Understood how to handle valid and invalid inputs in Verilog.

---

Do you want me to also prepare Day 23 topic suggestion** (something new but still based on combinational logic)?
