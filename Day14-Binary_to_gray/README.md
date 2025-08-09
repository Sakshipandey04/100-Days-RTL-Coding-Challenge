## Day 14 – Binary to Gray Code Converter (Behavioral Modeling)

## Objective

Implement a Binary-to-Gray code converter using Behavioral Modeling in Verilog and verify its correctness through simulation.

## Theory

Binary to Gray Conversion Rule:

MSB of Gray = MSB of Binary

Remaining bits of Gray = Binary bit XOR previous Binary bit

G[i] = B[i] ^ B[i+1]

Gray codes ensure only one bit changes between consecutive values, reducing errors in systems like rotary encoders and digital communication.
        
## Simulation Output (Waveform)

simulation waveform (from EDAPLAYGROUND) matches expected conversion:

Binary (B)	Gray (G)

0000	0000
0001	0001
0010	0011
0011	0010
0100	0110
0101	0111
0110	0101
0111	0100
1000	1100
1001	1101
1010	1111
1011	1110
1100	1010
1101	1011
1110	1001
1111	1000


## Conclusion

Successfully implemented Binary to Gray conversion using behavioral modeling.

The simulation matches the theoretical truth table, proving correctness.
