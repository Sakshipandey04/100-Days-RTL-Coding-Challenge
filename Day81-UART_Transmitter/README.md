## **Day 83 – UART Transmitter**

### **Objective**

Design and simulate an **8-bit UART(Universal Asynchronous Receiver Transmitter) Transmitter** that converts **parallel data** into **serial format** with proper start and stop bits.

---

###  **Features**

* 8-bit parallel data input
* Adds **1 start bit (0)** and **1 stop bit (1)** automatically
* Transmits **LSB first**
* **Baud-rate generator** controls bit timing
* **tx_busy** signal indicates when transmission is in progress

---

###  **I/O Description**

| Signal      | Direction | Width | Description                   |
| :---------- | :-------- | :---- | :---------------------------- |
| `clk`       | Input     | 1     | System clock                  |
| `rst`       | Input     | 1     | Active-high reset             |
| `tx_start`  | Input     | 1     | Initiates transmission        |
| `data_in`   | Input     | 8     | Parallel data input           |
| `tx_serial` | Output    | 1     | Serial output line            |
| `tx_busy`   | Output    | 1     | Transmission-in-progress flag |

---

###  **Files**

* `uart_tx.v` — Verilog design file
* `tb_uart_tx.v` — Testbench for simulation

---

###  **Expected Simulation Behavior**

1. When `tx_start = 1`, transmission begins and `tx_busy` = 1.
2. `tx_serial` outputs:

   * **Start bit (0)**
   * **8 data bits (LSB first)**
   * **Stop bit (1)**
3. After all bits are sent, `tx_busy` returns to 0.
4. Line remains idle (high) until the next `tx_start`.

----

###  **Outcome**

This project demonstrates the implementation of a **UART Transmitter** using sequential logic and finite-state control, forming the foundation for full UART communication in later RTL practice days.
