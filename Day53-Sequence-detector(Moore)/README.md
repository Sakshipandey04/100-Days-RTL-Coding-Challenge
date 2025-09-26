# Day 53 – FSM Sequence Detector (1011, Moore Machine)

## Problem Statement

Design a **Finite State Machine (FSM)** in Verilog that detects the sequence **"1011"** in a serial input stream.

* The FSM should be a **Moore machine** (output depends only on the state).
* Overlapping sequences should also be detected (e.g., input `1011011` contains two detections).
  
##  Design Explanation

* **FSM Type:** Moore

* **States:**

  * `S0` → Initial state / reset
  * `S1` → Detected `1`
  * `S2` → Detected `10`
  * `S3` → Detected `101`
  * `S4` → Detected `1011` (output = 1)

* After detection, FSM allows **overlapping sequences**.
  Example: For `1011011`, it outputs detection at both positions.

## Simulation

**Input Sequence Tested:** `1011011`

### Expected Behavior

* Output `y = 1` when the sequence **1011** is detected.
* Two detections in the given test sequence.

| Time | Input (x) | Sequence So Far | State | Output (y) |
| ---- | --------- | --------------- | ----- | ---------- |
| 10ns | 1         | "1"             | S1    | 0          |
| 20ns | 0         | "10"            | S2    | 0          |
| 30ns | 1         | "101"           | S3    | 0          |
| 40ns | 1         | "1011"          | S4    | 1 ✅        |
| 50ns | 0         | "0"             | S0    | 0          |
| 60ns | 1         | "1"             | S1    | 0          |
| 70ns | 1         | "1011" again    | S4    | 1 ✅        |


## Conclusion

The FSM successfully detects the sequence **"1011"** in a serial input stream, including overlapping occurrences.
Do you want me to prepare the **Mealy FSM version + README** for Day 54 so you can compare both styles directly?

