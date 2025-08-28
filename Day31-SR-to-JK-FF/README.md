## Day 31 – SR to JK Flip-Flop Conversion
/**Overview**/

In this task, I implemented the conversion of an SR Flip-Flop into a JK Flip-Flop using logic equations and the mapping of inputs.
The conversion is based on deriving equivalent SR inputs from the JK inputs such that the SR flip-flop behaves exactly like a JK flip-flop.

## SR Flip-Flop Truth Table
S	R	Q(next)	  Operation
0	0	Q	        No change
0	1	0	        Reset
1	0	1	        Set
1	1	–	        Invalid

## JK Flip-Flop Excitation Table
Q (present)	Q(next)	J 	K	   Operation
    0	        0	    0 	X 	 No change
    0	        1    	1	  X	   Set
    1	        0	    X	  1	   Reset
    1	        1	    X	  0	   No change
    0	        1	    1	  0	   Set
    1	        0	    0	  1	   Reset
    0	        0	    0	  0	   No change
    1	        1	    1	  1	   Toggle
(X = don’t care)

## Conversion Logic
J	K	 Equivalent S	  Equivalent R	  Output Behavior
0	0	      0	            0	          No change
0	1	      0	            1	          Reset
1	0	      1	            0	          Set
1	1	      Q'	          Q	          Toggle

## Conversion Equations:

S = J·Q'

R = K·Q

## Simulation Results

J=1, K=0 → Set Q=1

J=0, K=1 → Reset Q=0

J=1, K=1 → Toggle Q

J=0, K=0 → No change

## Learnings

Understood the truth table of SR flip-flop and the excitation table of JK flip-flop.

Derived conversion logic from JK inputs to SR inputs.

Strengthened basics of sequential circuit design.
