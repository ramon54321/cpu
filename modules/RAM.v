/*
    RAM:
      Basic memory chip.

    Usage:
      RAM_Volatile #(4, 8) ram(bus[7:0], data_push[3:0], OE, WE, clk);
*/
module RAM_Volatile(
  inout [dataWidth - 1:0] data,
  input [addressWidth -1:0] address,
  input OE,
  input WE,
  input clk);

  parameter addressWidth = 4;
  parameter dataWidth = 8;

  reg [dataWidth - 1:0] internalData [0:(1 << addressWidth) - 1];

  assign data = (OE && !WE) ? internalData[address] : {dataWidth{1'bZ}};

  always @ (posedge clk) begin
    if(WE && !OE) begin
      internalData[address] = data;
    end
  end
endmodule
