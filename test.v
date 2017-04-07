`include "modules/Registers.v"
`include "modules/RAM.v"
`include "modules/CPU.v"

module test;

  wire [15:0] bus;

  reg clk;

  CPU cpu(bus, clk);

  reg [7:0] busSet = 8'h11;
  assign bus[7:0] = busSet;

  reg enable = 0;
  reg latch = 0;
  reg increment = 0;

  Register_Counter_Buffered #(8) regA(bus[15:8], bus[7:0], enable, latch, increment, clk);

  initial begin
    $dumpvars(0, test);
    clk = 0;

    busSet = 8'h22;

    #10;
    enable = 1;
    #2;
    enable = 0;

    #5;
    latch = 1;
    #2;
    latch = 0;

    #5;
    enable = 1;
    #2;
    enable = 0;

    #5;
    increment = 1;
    #3;
    increment = 0;

    #5;
    enable = 1;
    #2;
    enable = 0;


    #100;


    $finish;
  end

  always begin
    #1;
    clk = ~clk;
  end

endmodule
