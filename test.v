`include "modules/Registers.v"

module test;

  wire [15:0] bus;

  reg clk, enable, latch;
  reg [15:0] data_push = 16'hABCD;

  Register_Buffered #(8) regA(bus[7:0], data_push, enable, latch, clk);

  initial begin

    $dumpvars(4, test);

    clk = 0;
    enable = 0;
    latch = 0;

    #11;
    latch = 1;
    #6;
    latch = 0;

    #20;
    enable = 1;
    #6;
    enable = 0;


    #100;


    $finish;
  end

  always begin
    #2;
    clk = ~clk;
  end

endmodule
