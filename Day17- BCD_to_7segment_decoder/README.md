# Day 17 – BCD to 7-Segment Decoder (Behavioral)

## Objective
Design and simulate a *4-bit BCD to 7-segment decoder* using behavioral modeling in Verilog for a common-cathode display.

## Design Details
- *Input:* bcd[3:0] → valid range: 0 to 9 (BCD format)
- *Output:* seg[6:0] → segment outputs {a,b,c,d,e,f,g} (active HIGH)
- *Behavior:* Displays decimal digits 0–9 on the 7-segment display; for invalid inputs (10–15), segments are turned off (0000000).

## Segment Encoding Table

| Decimal | BCD Input | seg[6:0] (a–g) | Display |
|---------|-----------|----------------|---------|
| 0       | 0000      | 1111110        | 0       |
| 1       | 0001      | 0110000        | 1       |
| 2       | 0010      | 1101101        | 2       |
| 3       | 0011      | 1111001        | 3       |
| 4       | 0100      | 0110011        | 4       |
| 5       | 0101      | 1011011        | 5       |
| 6       | 0110      | 1011111        | 6       |
| 7       | 0111      | 1110000        | 7       |
| 8       | 1000      | 1111111        | 8       |
| 9       | 1001      | 1111011        | 9       |
| 10–15   | 1010–1111 | 0000000        | Blank   |

## Testbench
The testbench (tb_bcd_to_7seg.v) iterates BCD values from 0 to 15 and logs the corresponding segment outputs.

## Simulation Tools
- *Icarus Verilog* for compilation and simulation
- *GTKWave* or EPWave for waveform viewing
