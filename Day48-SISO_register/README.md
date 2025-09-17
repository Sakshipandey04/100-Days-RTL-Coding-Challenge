# SISO Shift Register (Verilog)

##  Overview

This project demonstrates the design and simulation of a **Serial-In Serial-Out (SISO) Shift Register** in Verilog.
A SISO register accepts a single-bit input on every clock cycle and shifts it through a chain of flip-flops. The output is taken from the last stage, which makes the circuit suitable for serial data communication and temporary storage applications.

## Features

* Configurable number of stages (parameterized design).
* Asynchronous active-high reset to clear all flip-flops.
* Data shifts from **LSB to MSB** with every rising clock edge.
* Synthesizable for FPGA/ASIC implementation.
* Verified with behavioral simulation.

##  Working

* On each **positive clock edge**, the input bit (`serial_in`) enters the first flip-flop.
* The previous values stored in each flip-flop move one stage forward.
* After **N clock cycles** (where `N` is the number of flip-flops in the register), the first input bit appears at the output (`serial_out`).
* Example: For a 4-bit SISO shift register and input sequence `1, 0, 1, 1`:

  * Cycle 1 → Register content: `0001`, Output = `0`
  * Cycle 2 → Register content: `0010`, Output = `0`
  * Cycle 3 → Register content: `0101`, Output = `0`
  * Cycle 4 → Register content: `1011`, Output = `1`
* Thus, the register acts like a pipeline that delays data by `N` cycles.


##  Simulation Results

* The output matches the input sequence but is **delayed by N cycles**.
* Waveforms confirm correct shifting of bits through the register.
* Reset initializes all flip-flops to zero before shifting starts.
* 
## Applications

* Serial data transmission.
* Delay elements in digital pipelines.
* Temporary storage of data.
* Communication systems handling bit-serial data.
