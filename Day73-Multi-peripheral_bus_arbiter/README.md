---
## **Day 73 — Multi-Peripheral Bus Arbiter**

### **Overview**

This project implements a **Multi-Peripheral Bus Arbiter** system in Verilog.
It allows two peripherals to share a common bus using **priority-based arbitration**. Peripheral 1 has higher priority than Peripheral 2 when both request access simultaneously.

The design demonstrates basic SoC-style bus communication and arbitration between multiple devices.

---

### **Key Modules**

#### **1. `bus_arbiter.v`**

* Controls which peripheral can access the shared bus.
* Uses **priority logic**:

  * If both peripherals request simultaneously → Peripheral 1 wins.
* Generates `grant1` and `grant2` signals accordingly.

#### **2. `peripheral.v`**

* Simulates a simple 4-register memory bank with:

  * `wr_en`, `rd_en`, `addr`, `wdata`, and `rdata` signals.
* Each peripheral can read or write to its registers when granted bus access.

#### **3. `tb_bus_system.v`**

* Provides the testbench to verify correct arbitration and bus access.
* Stimulates different cases:

  * Individual peripheral writes
  * Simultaneous requests
  * Read-back operations
* Uses `$monitor` and waveform dumps for verification.

---

### **Signal Interface**

| Signal             | Direction | Description                   |
| :----------------- | :-------- | :---------------------------- |
| `clk`              | Input     | System clock                  |
| `rst`              | Input     | Active-high synchronous reset |
| `req1`, `req2`     | Input     | Peripheral request lines      |
| `grant1`, `grant2` | Output    | Arbiter grant lines           |
| `wr_en`, `rd_en`   | Input     | Write / Read enable           |
| `addr[1:0]`        | Input     | Register address              |
| `wdata[3:0]`       | Input     | Data to be written            |
| `rdata[3:0]`       | Output    | Data read from register       |

---

### **Arbiter Logic**

```text
if (req1)
    grant1 = 1, grant2 = 0;
else if (req2)
    grant1 = 0, grant2 = 1;
else
    both = 0;
```

---

### **Simulation Steps**

1. **Compile and run** in your simulator (e.g., Icarus Verilog, ModelSim, Vivado):

   ```bash
   iverilog -o bus_test bus_arbiter.v peripheral.v tb_bus_system.v
   vvp bus_test
   gtkwave bus.vcd
   ```
2. Observe signals:

   * `grant1`/`grant2` toggle correctly based on requests.
   * `rdata1` and `rdata2` show the correct values after read cycles.

---

### **Expected Behavior**

| Scenario                    | Expected Grant               | Data                 |
| --------------------------- | ---------------------------- | -------------------- |
| Only Peripheral 1 requests  | grant1 = 1                   | Writes/reads succeed |
| Only Peripheral 2 requests  | grant2 = 1                   | Writes/reads succeed |
| Both request simultaneously | grant1 = 1 (priority)        | P1 dominates         |
| Read cycles                 | Show previously written data | No ‘X’ values        |

---

### **Key Learnings**

* Arbitration techniques (priority vs round-robin)
* Bus sharing between multiple peripherals
* Timing synchronization for read/write cycles
* Avoiding unknown (X) values through reset and signal control

---
