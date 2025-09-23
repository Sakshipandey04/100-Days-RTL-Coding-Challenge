# Day 52 – Universal Shift Register

##  Overview

A **Universal Shift Register** is a versatile register that can perform four operations:

1. **Hold** the current data.
2. **Shift Right** (serial-in from left).
3. **Shift Left** (serial-in from right).
4. **Parallel Load** (load all bits at once).

This makes it useful in processors, communication systems and data manipulation tasks.

## Features

* Parameterized width (default: 8 bits).
* Four modes of operation: Hold, Shift Right, Shift Left, Parallel Load.
* Active-high reset.
* Serial inputs for both left and right shifts.

## I/O Ports

| Signal      | Direction | Width | Description                                                                |
| ----------- | --------- | ----- | -------------------------------------------------------------------------- |
| `clk`       | Input     | 1     | Clock signal                                                               |
| `rst`       | Input     | 1     | Active-high reset                                                          |
| `mode[1:0]` | Input     | 2     | Operation select: 00=Hold, 01=Shift Right, 10=Shift Left, 11=Parallel Load |
| `pdata`     | Input     | N     | Parallel data input                                                        |
| `sin_left`  | Input     | 1     | Serial input for left shift                                                |
| `sin_right` | Input     | 1     | Serial input for right shift                                               |
| `Q`         | Output    | N     | Register output                                                            |


##  Modes of Operation

* **00 → Hold**: Keeps the current contents.
* **01 → Shift Right**: Shifts right, `sin_left` enters at MSB.
* **10 → Shift Left**: Shifts left, `sin_right` enters at LSB.
* **11 → Parallel Load**: Loads parallel data from `p_data`.

##  Example Operation (N=8)

Let `p_data = 10110011`:

```
Cycle | mode | sin_left | sin_right | Q
------+-------+----------+-----------+----------
  1   | 11    |    X     |     X     | 10110011   (Parallel Load)
  2   | 01    |    1     |     X     | 11011001   (Shift Right, MSB=1)
  3   | 01    |    1     |     X     | 11101100
  4   | 10    |    X     |     0     | 11011000   (Shift Left, LSB=0)
  5   | 00    |    X     |     X     | 11011000   (Hold)
```


##  Applications

* Data storage and transfer.
* Serial-to-parallel and parallel-to-serial conversion.
* Arithmetic operations (multiplication/division by 2).
* Control registers in CPUs.
