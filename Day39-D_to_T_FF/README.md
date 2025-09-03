# 📘 D to T Flip-Flop Conversion

## 🔹 Step 1: Recall Characteristic Equations

* **D Flip-Flop:**

$$
Q_{next} = D
$$

* **T Flip-Flop:**

$$
Q_{next} = T \oplus Q
$$

(where ⊕ means XOR)


## 🔹 Step 2: Express D in terms of T and Q

Since **Q\_next (D) = T ⊕ Q**,

$$
D = T \oplus Q
$$

That’s the required conversion equation.

## 🔹 Step 3: Truth Table

| T | Q (Present) | Q(next) | D (= T ⊕ Q) | Operation |
| - | ----------- | ------- | ----------- | --------- |
| 0 | 0           | 0       | 0           | Hold      |
| 0 | 1           | 1       | 1           | Hold      |
| 1 | 0           | 1       | 1           | Toggle    |
| 1 | 1           | 0       | 0           | Toggle    |

## 🔹 Step 4: Excitation Table

For **T Flip-Flop behavior using D**:

| Q (Present) | Q(next) | T | Required D |
| ----------- | ------- | - | ---------- |
| 0           | 0       | 0 | 0          |
| 0           | 1       | 1 | 1          |
| 1           | 0       | 1 | 0          |
| 1           | 1       | 0 | 1          |

From this, we confirm:

$$
D = T \oplus Q
$$

✅ **Final Expression:**
A **T flip-flop can be implemented using a D flip-flop** by driving:

$$
D = T \oplus Q
$$
