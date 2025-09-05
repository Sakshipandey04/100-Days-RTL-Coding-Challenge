# Day 41 – RTL Challenge: T to JK Flip-Flop Conversion

## Objective

To convert a **JK Flip-Flop** into a **T (Toggle) Flip-Flop**.
This exercise helps understand how JK flip-flop behavior can be adapted to implement toggle functionality, which is widely used in counters and sequential circuits.

## Conversion Logic

* A **T Flip-Flop** toggles its output on a clock edge when `T = 1` and holds when `T = 0`.
* A **JK Flip-Flop** has the characteristic equation:

$$
Q_{next} = J \overline{Q} + \overline{K} Q
$$

* To make a JK flip-flop behave like a T flip-flop, set:

$$
J = T  
$$

$$
K = T
$$

* **Explanation:**

  * If `T = 0`, then `J = K = 0` → Flip-flop **holds** its state.
  * If `T = 1`, then `J = K = 1` → Flip-flop **toggles** its state.

## Truth Table

| T | Q (current) | Q (next) | Description    |
| - | ----------- | -------- | -------------- |
| 0 | 0           | 0        | Hold           |
| 0 | 1           | 1        | Hold           |
| 1 | 0           | 1        | Toggle (Set)   |
| 1 | 1           | 0        | Toggle (Reset) |


## Excitation Table (JK → T)

Shows the required **J and K inputs** to replicate T flip-flop behavior:

| Q (current) | Q (next) | T | J | K |
| ----------- | -------- | - | - | - |
| 0           | 0        | 0 | 0 | 0 |
| 0           | 1        | 1 | 1 | 1 |
| 1           | 0        | 1 | 1 | 1 |
| 1           | 1        | 0 | 0 | 0 |

## Key Observations

* **T = J = K** ensures simple toggle behavior.
* JK flip-flop inherently avoids the invalid state problem that SR flip-flops have.
* Conversion is widely used in **binary counters, frequency dividers, and sequential circuits**.
* Q only changes on the **rising edge of the clock**.


## Conclusion

Converting a JK flip-flop to a T flip-flop demonstrates **toggle functionality using universal flip-flops**. This reinforces understanding of **flip-flop equivalence**, excitation tables, and sequential logic design.
