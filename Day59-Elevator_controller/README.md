# Day59- Elevator Controller FSM

## **Project Overview**

This project implements a **finite state machine (FSM)** based controller for a **two-floor elevator** system. The FSM manages the lift's movement, door operations, and response to floor calls in a structured and predictable manner. This design is suitable for RTL (Register Transfer Level) implementation on FPGA or ASIC platforms.

---

## **Objectives**

* Design a **reliable FSM** to control lift operations.
* Ensure proper **floor selection, movement, and door operation**.
* Provide a **modular design** that can be extended to multi-floor lifts.
* Train in **FSM modeling, state encoding, and output logic** for RTL design.

---

## **System Inputs**

* `clk` : System clock for synchronous operation.
* `rst` : Synchronous reset to initialize the lift.
* `call1` : Call request from floor 1.
* `call2` : Call request from floor 2.
* `floor_sensor` : Sensor indicating the current floor of the lift.

---

## **System Outputs**

* `motor_up` : Signal to move the lift upwards.
* `motor_down` : Signal to move the lift downwards.
* `door_open` : Signal to open the lift door.

---

## **FSM Design**

The lift controller FSM consists of several states:

1. **IDLE_F1** – Lift idle at floor 1.
2. **IDLE_F2** – Lift idle at floor 2.
3. **MOVE_UP** – Lift moving from floor 1 to floor 2.
4. **MOVE_DOWN** – Lift moving from floor 2 to floor 1.
5. **DOOR_OPEN** – Lift door open for passenger entry/exit.

**State transitions** are triggered by floor calls and floor sensors, ensuring the lift moves efficiently between floors while opening and closing the doors as needed.

---

## **Features**

* Synchronous FSM design with **deterministic state transitions**.
* Handles multiple inputs (floor calls) while ensuring **safe lift operation**.
* Modular structure allows for **easy extension to more floors**.
* Clear separation of **state logic and output logic**.

---

## **Applications**

* Simulation and training in **digital logic design** and **FSMs**.
* Basis for **multi-floor lift control systems** in embedded applications.
* Educational project for **FPGA or ASIC design courses**.

---

## **Future Enhancements**

* Extend to **multi-floor lift system**.
* Add **priority handling** for multiple simultaneous floor calls.
* Include **timer-controlled door operation** for passenger safety.
* Implement **emergency stop and overload detection** signals.

