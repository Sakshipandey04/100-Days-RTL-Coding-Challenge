## JK Flip-Flop to D Flip-Flop Conversion

This project demonstrates how a JK Flip-Flop can be converted into a D Flip-Flop using Boolean logic.

## Concept

JK Flip-Flop has two inputs J and K.

D Flip-Flop has a single input D.

By deriving the equation of D in terms of J, K, and present state Q, we can implement a D Flip-Flop using a JK Flip-Flop.


The equation is:

D = J\overline{Q} + \overline{K}Q


## Truth Table (JK Flip-Flop)

J	K	Q(next)	Description

0	0	Q	Hold (No change)
0	1	0	Reset
1	0	1	Set
1	1	Q'	Toggle

## itation Table (D Flip-Flop)

Q (present)	Q(next)	D

0	0	0
0	1	1
1	0	0
1	1	1

## Key Idea

The excitation table of the D Flip-Flop matches the behavior of the JK Flip-Flop when we map the inputs using the conversion equation.

This proves that a JK Flip-Flop can be used to realize a D Flip-Flop.

---

Would you like me to also add a block diagram image (JK → D mapping) in the README (I can generate a diagram for you), so it looks more visually appealing on GitHub?
