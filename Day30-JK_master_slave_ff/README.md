 ## Day 30 – RTL Coding Challenge
Project: JK Master-Slave Flip-Flop (Verilog, Vivado)

## Problem Statement

Design and verify a JK Master-Slave Flip-Flop using Verilog HDL. Simulate the design in Xilinx Vivado and validate all possible input conditions (J, K) with asynchronous reset.

## Learning Objectives

Understand the race-around problem in simple JK flip-flops.

Learn how Master-Slave configuration solves this by using two latches controlled by opposite clock phases.

Practice writing synthesizable Verilog with always blocks for posedge/negedge events.

Develop a testbench to validate sequential logic.


## Design Summary

Inputs: J, K, clk, rst

Outputs: Q, Qn

Functionality:

J=0, K=0 → Hold (Q remains unchanged)

J=0, K=1 → Reset (Q=0)

J=1, K=0 → Set (Q=1)

J=1, K=1 → Toggle (Q flips)


Reset: Asynchronous, active high


## How JK Master-Slave Flip-Flop Works

A JK Flip-Flop can suffer from the race-around condition when both J=1 and K=1 while the clock is HIGH, because the output toggles continuously during that time.

The Master-Slave configuration fixes this by connecting two latches in series:

1. Master latch (positive edge triggered):

Captures input (J, K) at the rising edge of the clock.

While clock is HIGH, the master is enabled but its output does not immediately affect Q.


2. Slave latch (negative edge triggered):

Follows the master’s output at the falling edge of the clock.

Updates the final outputs (Q, Qn).


This ensures that Q changes only once per clock cycle, eliminating race-around.

## Operation Table:

J	K	Action	Description

0	0	Hold	Q stays the same
0	1	Reset	Q → 0
1	0	Set	Q → 1
1	1	Toggle	Q → ~Q (flip state)


## Simulation Results
The Vivado behavioral simulation matched theoretical expectations.

Reset: Q=0, Qn=1

Set: Q=1, Qn=0

Reset: Q=0, Qn=1

Toggle: Q flips on each falling clock edge

Hold: Q remains unchanged


Waveform Screenshot (Vivado):
Waveform_jk_ms_ff.png

## Key Takeaways

First sequential logic design with both posedge and negedge triggers.

Learned to properly separate design and testbench in Vivado.

Debugged simulation launch issues by setting testbench as Simulation Top.

Understood how Master-Slave eliminates race-around.

👉 Do you want me to also draw a simple block diagram (Master latch + Slave latch with clock arrows) and add it in your README for clarity? That would make your challenge report more visual and professional
