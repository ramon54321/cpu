/*
    Registers:
      A selection of Registers, which will latch data on the rising edge of the clock
      input when the latch signal is also high. The content of the register is output
      onto the output pins when the enable signal is high, otherwise the output pins
      are in a high capacitance state.

    Usage:
      Register_Buffered #(8) regA(bus[7:0], data_push, enable, latch, clk);
*/
module Register_Buffered(
    output [width - 1:0] data_out,
    input [width - 1:0] data_in,
    input enable,
    input latch,
    input clk);

  parameter width = 4;

  reg [width - 1:0] data_internal = {(width) {1'hX}};

  assign data_out = (enable == 1) ? data_internal : {(width) {1'hZ}};

  always @ (posedge clk) begin
    if(latch) begin
      data_internal = data_in;
    end
  end
endmodule

module Register_Counter_Buffered(
    output [width - 1:0] data_out,
    input [width - 1:0] data_in,
    input enable,
    input latch,
    input increment,
    input clk);

  parameter width = 4;

  reg [width - 1:0] data_internal = {(width) {1'hX}};

  assign data_out = (enable == 1) ? data_internal : {(width) {1'hZ}};

  always @ (posedge clk) begin
    if(latch) begin
      data_internal = data_in;
    end
    if(!latch && increment) begin
      data_internal = data_internal + 1;
    end
  end
endmodule
