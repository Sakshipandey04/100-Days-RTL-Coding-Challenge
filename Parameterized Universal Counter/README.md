# Day 77 — Parameterized Universal Counter

## Objective
Design a **parameterized N-bit universal counter** that supports multiple counting modes:  
- Up counting  
- Down counting  
- Up-Down counting (bidirectional)  
- Synchronous **reset** and **enable** control  

This module reinforces **sequential logic, counters, and parameterized design** in RTL.

---

## Description
The counter operates based on a **mode input**:  
- `00` → Hold (no counting)  
- `01` → Count Up  
- `10` → Count Down  
- `11` → Up-Down (alternating direction)

Other features include:  
- **Synchronous reset** to initialize the counter  
- **Enable signal** to start/stop counting  
- **Parameterizable bit-width** for scalability

This counter can be integrated into **timers, PWM generators, FSMs, or memory address counters**.

---

## Key Features
- N-bit **parameterized counter**  
- Multiple **counting modes**  
- **Enable/disable** functionality  
- **Synchronous reset**  
- Direction control for **up-down counting**

---

## Learning Outcomes
- Implement **sequential logic using flip-flops**  
- Learn **bidirectional counting** and control signals  
- Practice **parameterization** for reusable modules  
- Integrate counters in **larger RTL designs**

---


