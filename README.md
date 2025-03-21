# UVM-based-Verification-of-Sequential-Circuit-Data-Flip-Flop

This verification test bench defines 3 sequences to verify the D-flip flop

- Sequence 1 --> Reset is set to 1, so output of the flip flop has to be 0.
- Sequence 2 --> Reset is set to 0 and Data is randomized. The output has to follow the data input.
- Sequence 3 --> Both the reset and Data input are randomized and output of the flip flop is observed. 

This uses a configuration class that sets if the testbench uses a active or a passive agent. 
