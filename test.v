`include "modules/Registers.v"

module test;

  wire [15:0] bus;

  reg clk, enable0, latch0, enable1, latch1;
  reg [15:0] data_push0 = 16'h5B4E;
  reg [3:0] data_push1 = 4'hA;

  Register_16Bit_Buffered regA(bus, data_push0, enable0, latch0, clk);
  Register_4Bit_Buffered regB(bus[3:0], data_push1, enable1, latch1, clk);

  initial begin

    $dumpvars(4, test);

    clk = 0;
    enable0 = 0;
    latch0 = 0;
    enable1 = 0;
    latch1 = 0;

    #11;
    latch0 = 1;
    #6;
    latch0 = 0;

    #20;
    enable0 = 1;
    #6;
    enable0 = 0;




    #11;
    latch1 = 1;
    #6;
    latch1 = 0;

    #20;
    enable1 = 1;
    #6;
    enable1 = 0;

    #100;


    $finish;
  end

  always begin
    #2;
    clk = ~clk;
  end

endmodule
