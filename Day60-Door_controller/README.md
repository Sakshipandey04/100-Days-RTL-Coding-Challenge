# DAy60- Automatic Door Controller FSM

## **Project Overview**

This project implements an **automatic door controller** using a **finite state machine (FSM)**. The FSM controls the door’s movement based on sensor inputs, ensuring safe and reliable operation. The system is suitable for **embedded applications** such as automatic doors, gates, and security entry systems.

---

## **Objectives**

* Design a **robust FSM** to control door operations.
* Respond to **motion and obstacle sensors** in real-time.
* Ensure proper **opening, closing, and stopping** of the door.
* Gain experience with **FSM design, timed operations, and output control** in RTL.

---

## **System Inputs**

* `clk` : System clock for synchronous operation.
* `rst` : Synchronous reset to initialize the system.
* `motion_sensor` : Detects presence near the door (1 = person detected).
* `obstacle_sensor` : Detects obstacle while the door is closing (1 = obstacle detected).

---

## **System Outputs**

* `door_open` : Signal indicating the door is fully open.
* `door_close` : Signal indicating the door is fully closed.
* `motor` : Controls the door motor (1 = moving).

---

## **FSM Design**

The FSM consists of the following states:

1. **CLOSED** – Door fully closed, waiting for motion.
2. **OPENING** – Door is opening, motor active.
3. **OPEN** – Door fully open, remains open for a timed duration.
4. **CLOSING** – Door is closing, motor active.
5. **STOPPED** – Door stops due to obstacle detection.

**State transitions** are triggered by the sensors and timing counters to ensure safe and efficient door operation.

---

## **Features**

* Real-time response to **motion and obstacle sensors**.
* Timed open duration to allow passenger passage.
* Automatic transition between **opening, open, closing, and stopped states**.
* Modular design that can be **extended to multiple doors or integrated with security systems**.

---

## **Applications**

* Automatic doors in **buildings, malls, or transportation systems**.
* Gates and turnstiles for **access control**.
* Embedded system design practice for **FSM-based controllers**.

---

## **Future Enhancements**

* Adjustable open/close timing using a **configurable timer**.
* Integration with **alarm or safety systems** for enhanced security.
* Extend to **multiple-door systems** with synchronized control.
* Add **emergency stop and manual override** functionality.

---

## **Conclusion**

This project demonstrates the practical use of **finite state machines** in controlling real-world devices. The automatic door controller FSM is **reliable, modular, and scalable**, making it a valuable educational and practical RTL design project.


Do you want me to do that?
