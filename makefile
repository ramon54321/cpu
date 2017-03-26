view: test.v
	iverilog test.v
	vvp a.out
	gtkwave dump.vcd
