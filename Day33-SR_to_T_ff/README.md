# Day 33 – SR to T Flip-Flop

## Objective

Implement a **T flip-flop using an SR flip-flop** with proper input mapping.

## Concept

* A **T (Toggle) flip-flop** has one input (**T**) and output (**Q**).
* Behavior:

  * **T = 0 → No change (Hold state)**
  * **T = 1 → Q toggles (0 → 1 or 1 → 0)**

To design a T flip-flop from an SR flip-flop:

$$
S = T \cdot \overline{Q}, \quad R = T \cdot Q
$$

## Truth Table of T Flip-Flop

| **T** | **Qn** | **Qn+1** | Description |
| ----- | ------ | -------- | ----------- |
| 0     | 0      | 0        | Hold        |
| 0     | 1      | 1        | Hold        |
| 1     | 0      | 1        | Toggle      |
| 1     | 1      | 0        | Toggle      |

## Truth Table of SR Flip-Flop

| **S** | **R** | **Q(next)**   | Description |
| ----- | ----- | ------------- | ----------- |
| 0     | 0     | Q (no change) | Hold state  |
| 0     | 1     | 0             | Reset       |
| 1     | 0     | 1             | Set         |
| 1     | 1     | Invalid       | Not allowed |

## Mapping (T → SR Conversion)

$$
S = T \cdot \overline{Q}, \quad R = T \cdot Q
$$

| **T** | **Qn** | **S** | **R** | **Qn+1** |
| ----- | ------ | ----- | ----- | -------- |
| 0     | 0      | 0     | 0     | 0        |
| 0     | 1      | 0     | 0     | 1        |
| 1     | 0      | 1     | 0     | 1        |
| 1     | 1      | 0     | 1     | 0        |

This mapping perfectly replicates T flip-flop behavior 

## Excitation Table

The **excitation table** defines the required inputs to achieve state transitions.

### For SR Flip-Flop:

| **Qn** | **Qn+1** | **S**  | **R**  |
| ------ | -------- | ------ | ------ |
| 0      | 0        | 0      | 0 or 1 |
| 0      | 1        | 1      | 0      |
| 1      | 0        | 0      | 1      |
| 1      | 1        | 0 or 1 | 0      |

### For T Flip-Flop:

$$
T = Qn \oplus Qn+1
$$

| **Qn** | **Qn+1** | **T** |
| ------ | -------- | ----- |
| 0      | 0        | 0     |
| 0      | 1        | 1     |
| 1      | 0        | 1     |
| 1      | 1        | 0     |

With this mapping and analysis, an **SR flip-flop can be used to construct a T flip-flop**.
