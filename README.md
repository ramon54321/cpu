# Requirements
 - `apt-get install verilog`
 - `apt-get install gtkwave`

# Goal
The main goal of the project is to design and synthesize a simple cpu, which will be run on an fpga. The cpu has no requirements, but the initial target is to be able to calculate simple algorithms, such as computing Fibonacci numbers. I would also like to implement a very simple language, which can then be compiled into machine code specific to this cpu, allowing me to develop basic data structures, such as lists and trees.

I would like to implement some sort of hardware graphical processing, such as hardware matrix manipulation, and possibly run a very simple 3D scene from it onto an LCD display using the IO pins on the fpga.

# Dev Log
## April 5, 2017
I have completed the first set of basic buffered registers. I made sure to not use any features in verilog which are not synthesizable, in order to make sure I can actually use the module on the fpga.
