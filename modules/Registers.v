/*
    Registers:
      A selection of Registers, which will latch data on the rising edge of the clock
      input when the latch signal is also high. The content of the register is output
      onto the output pins when the enable signal is high, otherwise the output pins
      are in a high capacitance state.
*/
module Register_4Bit_Buffered(
    output [3:0] data_out,
    input [3:0] data_in,
    input enable,
    input latch,
    input clk);

  reg [3:0] data_internal = 4'hX;

  assign data_out = (enable == 1) ? data_internal : 4'hZ;

  always @ (posedge clk) begin
    if(latch) begin
      data_internal = data_in;
    end
  end
endmodule

module Register_8Bit_Buffered(
    output [7:0] data_out,
    input [7:0] data_in,
    input enable,
    input latch,
    input clk);

  reg [7:0] data_internal = 8'hXX;

  assign data_out = (enable == 1) ? data_internal : 8'hZZ;

  always @ (posedge clk) begin
    if(latch) begin
      data_internal = data_in;
    end
  end
endmodule

module Register_16Bit_Buffered(
    output [15:0] data_out,
    input [15:0] data_in,
    input enable,
    input latch,
    input clk);

  reg [15:0] data_internal = 16'hXXXX;

  assign data_out = (enable == 1) ? data_internal : 16'hZZZZ;

  always @ (posedge clk) begin
    if(latch) begin
      data_internal = data_in;
    end
  end
endmodule
