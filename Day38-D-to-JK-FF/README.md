# D to JK Flip-Flop Conversion

## 🔹 Introduction

A **JK flip-flop** can be converted to a **D flip-flop** by properly designing the **J** and **K** inputs in terms of **D (desired input)** and **Q (present state)**.

* **D Flip-Flop Characteristic Equation:**

$$
Q_{next} = D
$$

* **JK Flip-Flop Characteristic Equation:**

$$
Q_{next} = JQ' + K'Q
$$

To make the JK flip-flop behave like a D flip-flop, we equate both:

$$
D = JQ' + K'Q
$$

##  Truth Table (JK Flip-Flop)

| J | K | Q (Present) | Q(next) | Operation |
| - | - | ----------- | ------- | --------- |
| 0 | 0 | 0           | 0       | No change |
| 0 | 0 | 1           | 1       | No change |
| 0 | 1 | 0           | 0       | Reset     |
| 0 | 1 | 1           | 0       | Reset     |
| 1 | 0 | 0           | 1       | Set       |
| 1 | 0 | 1           | 1       | Set       |
| 1 | 1 | 0           | 1       | Toggle    |
| 1 | 1 | 1           | 0       | Toggle    |


## 🔹 Truth Table for D Flip-Flop

| D | Q (Present) | Q(next) | Operation |
| - | ----------- | ------- | --------- |
| 0 | 0           | 0       | Reset     |
| 0 | 1           | 0       | Reset     |
| 1 | 0           | 1       | Set       |
| 1 | 1           | 1       | Set       |


## 🔹 Excitation Table (D Flip-Flop in terms of JK)

To design JK inputs that behave like D:

| D | Q (Present) | Q(next) | J | K |
| - | ----------- | ------- | - | - |
| 0 | 0           | 0       | 0 | X |
| 0 | 1           | 0       | 0 | 1 |
| 1 | 0           | 1       | 1 | 0 |
| 1 | 1           | 1       | X | 0 |


## 🔹 Final Expressions

From the excitation table:

$$
J = D \cdot Q'
$$

$$
K = Q \cdot D'
$$

Thus, by driving **J** and **K** with these equations, a **JK flip-flop can function as a D flip-flop**.
