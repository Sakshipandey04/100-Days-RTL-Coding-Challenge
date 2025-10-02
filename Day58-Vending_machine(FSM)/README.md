# Day 58 – FSM for Vending 2 Products

## Problem Statement

Design a **Finite State Machine (FSM)** for a vending machine that sells **two products with different prices**.

* **Products & Prices:**

  * Product A → 25 units
  * Product B → 40 units

* **Input Signals:**

  * `coin10` → pulse when a 10-unit coin is inserted
  * `coin25` → pulse when a 25-unit coin is inserted
  * `sel` → product selection (`0` for A, `1` for B)
  * `buy` → pulse to attempt purchase

* **Output Signals:**

  * `dispense` → one-clock pulse when product is dispensed
  * `change` → amount of change to return

---

## Objective

* Accept coins and **accumulate total money**.
* Dispense the selected product if sufficient funds are available.
* Output the **exact change** if extra money is inserted.
* Reset total after each successful purchase.

---

## FSM Design

### States

The machine can be represented using **numeric totals as implicit states**, e.g., 0, 10, 20, 25, 30, 35, 40+, or with high-level states:

| State      | Meaning                               |
| ---------- | ------------------------------------- |
| IDLE       | Waiting for coins or selection        |
| ACCUMULATE | Coins being inserted                  |
| CHECK_BUY  | Check if enough money for product     |
| DISPENSE   | Dispense product and calculate change |
| RESET      | Reset total to 0                      |

### Transitions

* **IDLE → ACCUMULATE** when a coin is inserted.
* **ACCUMULATE → ACCUMULATE** on additional coins.
* **ACCUMULATE → CHECK_BUY** on `buy` signal.
* **CHECK_BUY → DISPENSE** if total ≥ selected product price.
* **CHECK_BUY → ACCUMULATE** if total < price (insufficient funds).
* **DISPENSE → RESET → IDLE** after dispensing and giving change.

---

## State Diagram (Conceptual)

```text
        +------+
        | IDLE |<---------------------+
        +------+                      |
           |                           |
   coin inserted or sel?               |
           v                           |
     +-----------+                     |
     | ACCUMULATE|---------------------+
     +-----------+
           |
           | buy pressed
           v
      +---------+
      | CHECK   |
      | BUY     |
      +---------+
     /           \
total>=price     total<price
   |                |
   v                |
+---------+          |
| DISPENSE|----------+
+---------+
     |
     v
   RESET
     |
     v
    IDLE
```

---

## Example Sequence

| Step | Coins Inserted | Product Selected | Total | Dispense | Change |
| ---- | -------------- | ---------------- | ----- | -------- | ------ |
| 1    | 25             | A                | 25    | 1        | 0      |
| 2    | 25 + 10        | B                | 35    | 0        | 0      |
| 3    | +25            | B                | 60    | 1        | 20     |

---
