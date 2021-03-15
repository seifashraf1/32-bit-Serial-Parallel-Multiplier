all:
	iverilog Multiplier.v Multiplier_tb.v -o Multiplier.vvp
	vvp Multiplier.vvp
	gtkwave Multiplier.vcd

