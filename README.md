# 32-bit-SPM
# By: Seif Ashraf

How to use this module?
------------------------
* You can edit the testbench with any values you want.
* You should have iverilog and GTKWave installed.


1) open your terminal
2) run make
3) expect the results printed on the terminal, and GTKWave opened to view the simulation 

Variables Naming Convention:
-----------------------------
- All signal names, variable names, and port names are in lower cases.
- All parameter names are in capitals: e.g. STATE_WAIT

#NOTE: 
In the screenshot please note that the result of the multiplication is present after the +ve edge of the done signal by one clock cycle it gets updated.