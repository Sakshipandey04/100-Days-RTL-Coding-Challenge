# Day 36 – JK Flip-Flop to T Flip-Flop Conversion  

This project demonstrates how a **JK Flip-Flop** can be configured to function as a **T (Toggle) Flip-Flop**.  

## Concept  

- **T Flip-Flop Behavior:**  
  - `T = 0` → Hold (no change): \( Q_{next} = Q \)  
  - `T = 1` → Toggle: \( Q_{next} = \overline{Q} \)  

- **Mapping from JK to T:**  
  - Set **J = T** and **K = T**.  
  - This ensures:  
    - When `T = 0 → J=K=0 → Hold`  
    - When `T = 1 → J=K=1 → Toggle`  

Thus, a JK Flip-Flop can behave exactly like a T Flip-Flop.  

## Truth Table (JK Flip-Flop)  

| J | K | \( Q_{next} \) | Description |  
|---|---|---------------|-------------|  
| 0 | 0 | Q             | Hold        |  
| 0 | 1 | 0             | Reset       |  
| 1 | 0 | 1             | Set         |  
| 1 | 1 | \(\overline{Q}\) | Toggle   |  

## Excitation Table (T Flip-Flop)  

| Q (Present) | Q (Next) | T |  
|-------------|----------|---|  
| 0           | 0        | 0 |  
| 0           | 1        | 1 |  
| 1           | 0        | 1 |  
| 1           | 1        | 0 |  


## Key Idea  

Using **J = T** and **K = T**, the JK Flip-Flop perfectly replicates T Flip-Flop behavior:  
- **T = 0 → Hold**  
- **T = 1 → Toggle**  

## Learning Outcomes  

- Gained understanding of flip-flop interconversion.  
- Verified sequential circuit behavior via simulation.  
- Strengthened concepts of **Hold** and **Toggle** operations.    
