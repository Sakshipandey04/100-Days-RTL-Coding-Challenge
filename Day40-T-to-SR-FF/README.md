# Day 40 – RTL Challenge: SR → T Flip-Flop Conversion

## Objective

To convert an **SR (Set-Reset) Flip-Flop** into a **T (Toggle) Flip-Flop** using RTL design concepts. This helps understand flip-flop equivalence and how to implement toggle behavior from basic set-reset logic.

## Conversion Logic

* A **T Flip-Flop** toggles its output on a clock edge when `T = 1` and holds when `T = 0`.
* For conversion from SR flip-flop:

$$
T = S \oplus R
$$

* **S** = Set input of SR flip-flop

* **R** = Reset input of SR flip-flop

* **T** = Toggle input for the T flip-flop

* Invalid SR state `(S=1, R=1)` is treated as **Hold** to avoid undefined behavior.

## Truth Table

| S | R | Q (current) | Q (next) | Description    |
| - | - | ----------- | -------- | -------------- |
| 0 | 0 | 0           | 0        | Hold           |
| 0 | 0 | 1           | 1        | Hold           |
| 0 | 1 | 0           | 0        | Reset (Q=0)    |
| 0 | 1 | 1           | 0        | Reset (Q=0)    |
| 1 | 0 | 0           | 1        | Set (Q=1)      |
| 1 | 0 | 1           | 1        | Set (Q=1)      |
| 1 | 1 | 0           | 0        | Invalid → Hold |
| 1 | 1 | 1           | 1        | Invalid → Hold |

## Excitation Table (SR → T)

Shows required **T input** to replicate SR flip-flop behavior:

| Q (current) | Q (next) | S | R | T = S ⊕ R |
| ----------- | -------- | - | - | --------- |
| 0           | 0        | 0 | 0 | 0         |
| 0           | 1        | 1 | 0 | 1         |
| 1           | 0        | 0 | 1 | 1         |
| 1           | 1        | 1 | 0 | 1         |
| Any         | Hold     | 1 | 1 | 0         |


## Key Observations

* **Q changes only on the clock’s rising edge.**
* **T determines whether Q toggles or holds.**
* Conversion allows SR flip-flops to behave like toggle flip-flops without changing hardware structure.
* Invalid SR input is safely treated as Hold to maintain reliability.


## Conclusion

The **SR → T Flip-Flop conversion** reinforces understanding of flip-flop behavior, excitation tables, and clocked sequential logic. This design is useful in **counter circuits, toggle operations, and synchronous sequential systems**.
