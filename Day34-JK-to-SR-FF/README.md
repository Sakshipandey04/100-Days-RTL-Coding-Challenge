# Day 34 — README: JK → SR Flip-Flop

## Overview

This README documents the theory and mapping used on **Day 34** of the RTL challenge: converting/expressing an **SR flip-flop** behaviour using a **JK flip-flop**. It contains the characteristic equations, truth tables, excitation tables, and practical notes (no RTL code included).

## 1. Key idea

* The **JK flip-flop** is a universal flip-flop. By choosing appropriate inputs, a JK can emulate SR, D, or T flip-flops.
* A straightforward mapping to obtain SR behaviour from JK inputs is:

  * **S = J**
  * **R = K**
* Important difference: the SR flip-flop has an invalid input combination (S=1, R=1). The JK resolves this by performing a **toggle** when J=K=1.
  
## 2. Characteristic equations

### SR flip-flop

The next state (Q+) of an SR flip-flop (with active-high inputs) can be written as:

$Q^{+} = S + Q \cdot R'$

Explanation:

* If S = 1 → Q+ = 1 (set)
* Else if R = 1 → Q+ = 0 (reset)
* Else (S = 0, R = 0) → Q+ = Q (hold)
* S = R = 1 is the forbidden/invalid condition for a pure SR latch/flip-flop.

### JK flip-flop (characteristic equation)

The JK flip-flop next-state equation is:

$Q^{+} = J \cdot Q' + K' \cdot Q$

This compactly captures all four behaviours when you vary J and K (hold, set, reset, toggle).

## 3. Truth table (SR)

|  S |  R | Q (current) | Q+ (next) | Function                 |
| -: | -: | ----------: | --------: | ------------------------ |
|  0 |  0 |           0 |         0 | Hold (no change)         |
|  0 |  0 |           1 |         1 | Hold (no change)         |
|  0 |  1 |           0 |         0 | Reset → 0                |
|  0 |  1 |           1 |         0 | Reset → 0                |
|  1 |  0 |           0 |         1 | Set → 1                  |
|  1 |  0 |           1 |         1 | Set → 1                  |
|  1 |  1 |           0 |         — | Invalid (race/forbidden) |
|  1 |  1 |           1 |         — | Invalid (race/forbidden) |

> Notes: The two rows with S=1,R=1 are undefined for the SR flip-flop (often called the forbidden state). Different physical implementations handle it differently; it should be avoided.

## 4. Truth table (JK)

|  J |  K | Q (current) | Q+ (next) | Function       |
| -: | -: | ----------: | --------: | -------------- |
|  0 |  0 |           0 |         0 | Hold           |
|  0 |  0 |           1 |         1 | Hold           |
|  0 |  1 |           0 |         0 | Reset          |
|  0 |  1 |           1 |         0 | Reset          |
|  1 |  0 |           0 |         1 | Set            |
|  1 |  0 |           1 |         1 | Set            |
|  1 |  1 |           0 |         1 | Toggle (0 → 1) |
|  1 |  1 |           1 |         0 | Toggle (1 → 0) |

## 5. Excitation tables

Excitation tables tell us what inputs are required to **cause** a transition from current Q to desired Q+.

### SR flip-flop excitation table

|  Q | Q+ | S (required) | R (required) | Remarks        |
| -: | -: | -----------: | -----------: | -------------- |
|  0 |  0 |            0 |            0 | Hold (S=0,R=0) |
|  0 |  1 |            1 |            0 | Set            |
|  1 |  0 |            0 |            1 | Reset          |
|  1 |  1 |            0 |            0 | Hold (S=0,R=0) |

> Observation: For SR, the transition 0 → 1 requires S=1,R=0; 1 → 0 requires S=0,R=1. There is no valid SR assignment for forcing a toggle in one clock when S and R are both allowed to be 1 (that is the forbidden combination).

### JK flip-flop excitation table

|  Q | Q+ | J (required) | K (required) | Remarks                  |
| -: | -: | -----------: | -----------: | ------------------------ |
|  0 |  0 |            0 |            x | Hold (J=0; K don't care) |
|  0 |  1 |            1 |            0 | Set (J=1,K=0)            |
|  1 |  0 |            0 |            1 | Reset (J=0,K=1)          |
|  1 |  1 |            x |            0 | Hold (K=0; J don't care) |

*Using “x” to denote “don’t care”.*

> Important: For JK, to force a **toggle** (Q → Q+ where Q+ = ¬Q) you use J=K=1. This is how JK resolves the SR-forbidden case.

## 6. Mapping JK → SR (practical notes)

* Direct mapping: **S = J**, **R = K**. Under this mapping:

  * (S,R) = (0,0) ⇄ (J,K) = (0,0) → Hold
  * (S,R) = (1,0) ⇄ (J,K) = (1,0) → Set
  * (S,R) = (0,1) ⇄ (J,K) = (0,1) → Reset
  * (S,R) = (1,1) ⇄ (J,K) = (1,1) → SR-invalid becomes JK-**toggle**

**Design implication:** If you need strict SR behaviour and must avoid S=R=1, then you should ensure the circuit driving J and K never asserts both simultaneously. If you accept JK’s toggle behavior for that case, mapping is straightforward.

## 7. Asynchronous reset and initial conditions

* Typical implementations include an asynchronous active-high or active-low reset. In most design write-ups you will see an asynchronous active-high `reset` that forces Q→0 and Qbar→1 immediately when asserted.
* Always document reset polarity and initial Q state in your design notes.
