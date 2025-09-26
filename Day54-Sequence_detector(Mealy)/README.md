# Day 54 – FSM Sequence Detector (1011, Mealy Machine)

## Problem Statement

Design a **Finite State Machine (FSM)** in Verilog that detects the sequence **"1011"** in a serial input stream.

* The FSM should be a **Mealy machine** (output depends on both state and input).
* Overlapping sequences should also be detected (e.g., input `1011011` contains two detections).

##  Design Explanation

* **FSM Type:** Mealy

* **States:**

  * `S0` → Initial state / reset
  * `S1` → Detected `1`
  * `S2` → Detected `10`
  * `S3` → Detected `101`

* **Output Behavior:**

  * In Mealy FSM, output is asserted **immediately when the last `1` of "1011" is received**.
  * Faster response compared to Moore FSM (Day 53).

* **Overlapping Allowed:**

  * Example: For input `1011011`, FSM detects two valid sequences.

## Simulation

**Input Sequence Tested:** `1011011`

### Expected Behavior

* Output `y = 1` on the **last bit of "1011"**.
* Two detections in the given test sequence.

| Time | Input (x) | Sequence So Far | State | Output (y) |
| ---- | --------- | --------------- | ----- | ---------- |
| 10ns | 1         | "1"             | S1    | 0          |
| 20ns | 0         | "10"            | S2    | 0          |
| 30ns | 1         | "101"           | S3    | 0          |
| 40ns | 1         | "1011"          | S3→S1 | 1 ✅        |
| 50ns | 0         | "0"             | S0    | 0          |
| 60ns | 1         | "1"             | S1    | 0          |
| 70ns | 1         | "1011" again    | S3→S1 | 1 ✅        |

##  Conclusion

The FSM successfully detects the sequence **"1011"** in a serial input stream using the **Mealy approach**.

* Output appears **immediately** on the last input bit.
* Overlapping detections are handled correctly.
* Compared to Moore FSM, Mealy FSM requires **fewer states** and reacts **one cycle earlier**.
