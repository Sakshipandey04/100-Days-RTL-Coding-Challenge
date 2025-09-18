# SIPO Shift Register (Verilog)

## Overview

This project demonstrates the design and simulation of a **Serial-In Parallel-Out (SIPO) Shift Register** in Verilog.
A SIPO register accepts serial input data (one bit per clock cycle) and provides the collected bits simultaneously as a parallel output. It is widely used in digital communication systems where data is transmitted serially but processed in parallel.

## Features

* Configurable number of stages (parameterized design).
* Asynchronous active-high reset to clear all flip-flops.
* Collects serial data over multiple clock cycles and makes it available in parallel form.
* Fully synthesizable for FPGA/ASIC implementation.
* Verified using behavioral simulation.
  
##  Working

* On each **positive clock edge**, the serial input bit is shifted into the first flip-flop.
* Previous values stored in each flip-flop move forward by one stage.
* After **N clock cycles** (where `N` is the register size), the last `N` input bits are available at the parallel output.
* Example: For a 4-bit SIPO register and input sequence `1, 0, 1, 1`:

  * Cycle 1 → Output = `0001`
  * Cycle 2 → Output = `0010`
  * Cycle 3 → Output = `0101`
  * Cycle 4 → Output = `1011`
* Thus, the register converts a serial data stream into a parallel word.
  
## Simulation Results

* The parallel output builds up as new serial bits are shifted in.
* After the required number of clock cycles, the output matches the full input word.
* Reset initializes all stages to zero before data shifting starts.

## Applications

* Serial-to-parallel data conversion.
* Communication systems (e.g., UART receiver).
* Data buffering and temporary storage.
* Digital interfacing where parallel processing is required from serial input streams.
