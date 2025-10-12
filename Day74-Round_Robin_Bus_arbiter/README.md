## **Day 74 — Round-Robin Multi-Peripheral Bus Arbiter**

### **Overview**

This project implements a **Round-Robin Bus Arbiter** that allows multiple peripherals to share a common bus **fairly**.
Unlike fixed-priority arbitration (Day 73), where one peripheral always had precedence, this version **rotates priority** on every simultaneous request to ensure **equal access** and prevent **starvation**.

This design concept is widely used in SoC interconnects like **AMBA AHB**, **AXI**, and **Wishbone**.

---

### **Design Features**

* Supports **2 peripherals** (easily scalable to more).
* Uses **toggle-based fairness control** with `last_grant`.
* Grants bus access alternately on simultaneous requests.
* Clean synchronous design using `posedge clk`.
* Compatible with the same **peripheral module** from Day 73.

---

### **Module Interface**

| Signal             | Direction | Description                             |
| :----------------- | :-------- | :-------------------------------------- |
| `clk`              | Input     | System clock                            |
| `rst`              | Input     | Active-high synchronous reset           |
| `req1`, `req2`     | Input     | Request signals from peripherals        |
| `grant1`, `grant2` | Output    | Grant signals to peripherals            |
| `last_grant`       | Internal  | Tracks which peripheral was last served |

---

### 🔄 **Round-Robin Logic**

```verilog
if (req1 && req2)
    // both request -> alternate
    if (last_grant == 0)
        grant2 <= 1; last_grant <= 1;
    else
        grant1 <= 1; last_grant <= 0;
```

When both peripherals request access simultaneously, the arbiter alternates which one gets the grant based on `last_grant`.

---

### **Expected Behavior**

| Time (ns) | req1 | req2 |         grant1        | grant2 | Description             |
| :-------: | :--: | :--: | :-------------------: | :----: | :---------------------- |
|     40    |   1  |   0  |           1           |    0   | Peripheral 1 only       |
|     80    |   0  |   1  |           0           |    1   | Peripheral 2 only       |
|  120–220  |   1  |   1  |         1→0→1         |  0→1→0 | Alternating fair access |
|    260+   |   -  |   -  | Round-robin continues |        |                         |

---

### **Key Learnings**

* Understanding **fair bus arbitration**.
* Avoiding **peripheral starvation** with round-robin logic.
* Maintaining fairness with simple **state tracking**.
* Real-world importance in **multi-master SoC designs**.

---

### **Block Diagram**

```
             +-----------------------------+
             |     Round-Robin Arbiter     |
             |-----------------------------|
     req1 -->|                             |--> grant1
     req2 -->|      Arbitration Logic       |--> grant2
             |    (Toggle using last_grant) |
             +-------------^---------------+
                           |
                           |
                        last_grant
```
