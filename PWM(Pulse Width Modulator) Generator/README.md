## **Day 76 — PWM (Pulse Width Modulation) Generator**

### **Objective**

To design a **parameterized PWM generator** that produces a digital signal with a controllable **duty cycle** and fixed frequency using a counter-based approach.

---

### **Description**

* The PWM generator operates by comparing a **ramp counter** value with a **duty cycle register**.
* When the counter value is less than the duty cycle, the output remains **high**; otherwise, it goes **low**.
* The module includes:

  * **Clock divider** to control PWM frequency
  * **Parameterizable counter width** for resolution control
  * **Duty cycle input** to vary output pulse width dynamically

---

### **Key Features**

* Parameterized **counter bit width (N-bit)**
* Configurable **duty cycle and frequency**
* Synchronous **reset** and **enable**
* Clean and simple **combinational comparison logic**

---

### **Learning Outcomes**

* Understanding **counter-based sequential design**
* Implementing **pulse width modulation** logic
* Working with **parameterization** for flexible RTL modules
* Testing **timing-based outputs** in simulation waveforms

---

### **Verification Ideas**

* Sweep duty cycle from **0% → 100%**
* Observe the **PWM waveform** on simulation — high period increases with duty cycle
* Verify correct **reset behavior** and **enable/disable control**

---

### **Extensions**

* Dual or multi-channel PWM generator
* Variable frequency control
* Add **phase-shift** between multiple PWM outputs
* Integrate into **motor control** or **LED dimming** applications
