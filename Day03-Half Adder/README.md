# Objective:

Design and simulate a Half Adder circuit using:

Structural Modeling

Dataflow Modeling

Behavioral Modeling

# What is a Half Adder?

A Half Adder is a basic combinational circuit that performs the addition of two single-bit binary numbers (A and B).
It produces:

Sum = A ⊕ B (XOR)

Carry = A • B (AND)


# Modeling Styles Used:

1. Structural Modeling

Mimics real-world hardware.

Instantiates basic logic gates (and, xor) to build the circuit.

Example:

xor(sum, a, b);
and(carry, a, b);


2. Dataflow Modeling

Uses continuous assignments and logical operators to describe behavior.

Example:

assign sum = a ^ b;
assign carry = a & b;


3. Behavioral Modeling

Uses always blocks and procedural statements.

Describes logic using if or case constructs.

Example:

always @(*) begin
    sum = a ^ b;
    carry = a & b;
end


 # Files Included:

half_adder_structural.sv

half_adder_dataflow.sv

half_adder_behavioral.sv

tb_half_adder.v – Testbench used to test all three models.

output– Waveform file for signal analysis.


# Simulation

Run the design on:

EDA Playground

OR Local simulator like Xilinx Vivado / Icarus Verilog.

Use EPWave or GTKWave to view dump.vcd waveform output.


# Learning Outcome

Understood the different styles of modeling in Verilog.

Learned how the same logic can be expressed in multiple ways.

Practiced waveform debugging using a simulator.
