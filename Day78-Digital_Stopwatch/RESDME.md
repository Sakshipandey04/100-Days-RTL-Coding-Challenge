# Day 78 — Digital Stopwatch / Timer

## Objective
Design a **parameterized digital stopwatch/timer** that counts **seconds and minutes**, supporting:  
- Start / Stop control  
- Synchronous Reset  
- Optional Alarm output when a preset time is reached  

This practice strengthens **sequential logic, counters, and timing-based RTL design** skills.

---

## Description
The timer consists of two cascading counters:  
- **Seconds counter (0–59)**  
- **Minutes counter (0–59)**  

Behavior:  
- Seconds increment every clock tick.  
- When seconds reach 59, reset to 0 and increment minutes.  
- Optional alarm triggers when seconds and minutes match preset values.  
- Synchronous reset initializes the timer.  
- Enable input starts/stops counting.

---

## Key Features
- Parameterized counter width for seconds and minutes  
- Enable / disable functionality for start/stop  
- Synchronous reset  
- Optional alarm output for preset time  
- Modular design for easy integration with displays or other logic

---

## Learning Outcomes
- Implement **sequential counters with enable/reset**  
- Understand **cascading counters for multi-digit timing**  
- Parameterize RTL modules for flexible design  
- Observe **timing behavior in waveform simulation**
