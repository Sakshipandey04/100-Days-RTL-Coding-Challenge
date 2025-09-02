# SR Flip-Flop (implemented using a D Flip-Flop)

## Project summary
This project shows how an SR (Set-Reset) flip-flop can be realized using a D flip-flop by driving the D input with the expression:

D = S + (Rbar. Q)

Below are the SR truth table and the excitation table that shows required SR inputs for state transitions and the corresponding D value (since a D-FF directly follows \(Q_{next}=D\)).

## SR Truth Table

| S | R | Q(next) | Description        |
|:-:|:-:|:-------:|--------------------|
| 0 | 0 |   Q     | Hold (no change)   |
| 0 | 1 |   0     | Reset              |
| 1 | 0 |   1     | Set                |
| 1 | 1 |   X     | Invalid / Forbidden|

> Note: `Q` in the Hold row means the next state remains the current state. `X` denotes an invalid/undefined result for SR=11.

## Excitation Table (SR → desired transition)  
This table lists the **current state** `Q(t)`, the **desired next state** `Q(t+1)`, the **SR inputs** required to cause that transition, and the **D** value required for a D flip-flop to produce the same `Q(t+1)`.

| Q(t) | Q(t+1) | Required S | Required R | D (for D-FF) | Comment              |
|:----:|:------:|:----------:|:----------:|:------------:|----------------------|
| 0    | 0      | 0          | 0          | 0            | Hold                 |
| 0    | 1      | 1          | 0          | 1            | Set                  |
| 1    | 0      | 0          | 1          | 0            | Reset                |
| 1    | 1      | 0          | 0          | 1            | Hold (retain 1)      |

- For a D flip-flop, `D` must equal the required `Q(t+1)`.  
- Using the conversion equation \(D = S + (\overline{R} \cdot Q)\), the D input reproduces the SR behaviour for all valid SR combinations.

## Notes
- The input combination `S=1, R=1` is **invalid** for the SR flip-flop and should be avoided in designs.  
- When implementing SR with a D flip-flop, ensure `S=R=1` is prevented or handled, because feeding such a combination may produce an undefined/undesired effect depending on implementation and timing.

