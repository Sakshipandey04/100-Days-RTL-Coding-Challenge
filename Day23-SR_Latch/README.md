## Day 23 – SR Latch using Behavioral Modeling

## Project Overview

In this project, I implemented an SR Latch (Set-Reset Latch) using Verilog behavioral modeling as part of my 100 Days RTL Coding Challenge.

An SR Latch is the simplest sequential circuit, built using NOR/ NAND gates. It stores 1-bit of information and operates based on two inputs:

S (Set) – Sets output Q = 1

R (Reset) – Resets output Q = 0


The latch holds its previous state when both inputs are low, but the state becomes invalid when both inputs are high.

## Tools & Technology

Language: Verilog HDL

Modeling Style: Behavioral

Simulator: EDA Playground

Waveform Viewer: EPWave


## Truth Table

S	R	Q (Next State)	Q̅ (Complement)	Description

0	0	Hold (Previous Q)	Hold	Memory / Hold
0	1	0	1	Reset
1	0	1	0	Set
1	1	X (Invalid)	X	Invalid State

## Expected Waveform

At S=1, R=0 → Q=1, Q̅=0

At S=0, R=1 → Q=0, Q̅=1

At S=0, R=0 → Holds previous state

At S=1, R=1 → Invalid (X)
