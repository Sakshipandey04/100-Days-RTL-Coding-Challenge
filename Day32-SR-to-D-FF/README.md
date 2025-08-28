# Day 32 – SR to D Flip-Flop

##  Objective

Implement a **D flip-flop using an SR flip-flop** by proper mapping of inputs.

## Concept

* An **SR flip-flop** works with **Set (S)** and **Reset (R)** inputs.
* A **D flip-flop** has a single **D (Data)** input.
* To replicate D flip-flop behavior using SR:

$$
S = D, \quad R = \overline{D}
$$

This ensures:

* When **D = 1 → S = 1, R = 0 → Q = 1 (Set)**
* When **D = 0 → S = 0, R = 1 → Q = 0 (Reset)**

## Truth Table of D Flip-Flop

| **D** | **Q(next)** | Description |
| ----- | ----------- | ----------- |
| 0     | 0           | Reset       |
| 1     | 1           | Set         |

## Truth Table of SR Flip-Flop

| **S** | **R** | **Q(next)**   | Description |
| ----- | ----- | ------------- | ----------- |
| 0     | 0     | Q (no change) | Hold state  |
| 0     | 1     | 0             | Reset       |
| 1     | 0     | 1             | Set         |
| 1     | 1     | Invalid       | Not allowed |


## Mapping (D → SR Conversion)

$$
S = D, \quad R = \overline{D}
$$

| **D** | **S** | **R** | **Q(next)** |
| ----- | ----- | ----- | ----------- |
| 0     | 0     | 1     | 0           |
| 1     | 1     | 0     | 1           |

This perfectly matches the D flip-flop behavior 

## Excitation Table

The **excitation table** tells us what inputs are required to move from the **present state (Qn)** to the **next state (Qn+1)**.

### For SR Flip-Flop:

| **Qn** | **Qn+1** | **S**  | **R**  |
| ------ | -------- | ------ | ------ |
| 0      | 0        | 0      | 0 or 1 |
| 0      | 1        | 1      | 0      |
| 1      | 0        | 0      | 1      |
| 1      | 1        | 0 or 1 | 0      |

### For D Flip-Flop (simplified):

$$
D = Qn+1
$$

| **Qn** | **Qn+1** | **D** |
| ------ | -------- | ----- |
| 0      | 0        | 0     |
| 0      | 1        | 1     |
| 1      | 0        | 0     |
| 1      | 1        | 1     |

With this mapping and table analysis, we can clearly see how an **SR flip-flop can function as a D flip-flop**.
