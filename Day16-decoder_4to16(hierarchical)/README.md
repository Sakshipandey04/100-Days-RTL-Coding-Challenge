## Day 16 – 4-to-16 Decoder (Hierarchical Design)

## Objective

To design and implement a 4-to-16 Decoder using hierarchical design methodology, by reusing two 3-to-8 decoders from the previous project.
This demonstrates code modularity, reusability, and scalability in digital design.

## Description

A 4-to-16 decoder takes a 4-bit binary input and activates exactly one of the 16 outputs based on the input value.

It uses Enable (EN) to control activation.

The MSB (in[3]) is used to select between the lower half (0–7) and the upper half (8–15) outputs.

Each half is implemented by a 3-to-8 decoder module.


## Block Diagram

  EN       ----┐
                ├──> d0 (3-to-8) --> out[7:0]
  in[3] -------┘
   EN      ----┐
                ├──> d1 (3-to-8) --> out[15:8]
  in[3] -------┘


## Applications

Address decoding in memory systems.

Instruction decoding in processors.

Data selection in multiplexed systems.


## Simulation Output (Waveform Example)

EN	IN[3:0]	OUT[15:0]

1	0000	0000 0000 0000 0001
1	0001	0000 0000 0000 0010
1	0111	0000 0000 1000 0000
1	1000	0000 0001 0000 0000
1	1111	1000 0000 0000 0000
0	XXXX	0000 0000 0000 0000


## Key Learning Points

Reusing smaller modules improves design efficiency.

Hierarchical design is scalable for complex circuits.

Proper enable control prevents unintended outputs.
