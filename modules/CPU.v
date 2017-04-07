module CPU(
  inout [busWidth - 1:0] bus,
  input clk);

  parameter busWidth = 16;

  // Control
  reg MAR_OE = 0;
  reg MAR_LE = 0;

  reg RAM_OE = 0;
  reg RAM_WE = 0;

  // Nets
  wire [15:0] MAR_RAM; // Connects MAR output to RAM address

  Register_Buffered #(16) MAR(MAR_RAM[15:0], bus[15:0], MAR_OE, MAR_LE, clk);
  RAM_Volatile #(16, 8) RAM(bus[15:0], MAR_RAM[15:0], RAM_OE, RAM_WE, clk);

endmodule
