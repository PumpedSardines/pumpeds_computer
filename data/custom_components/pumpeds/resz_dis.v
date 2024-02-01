module resz_dis (clk, rst, Res_line, Disable, Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [31:0] Res_line;
  input  wire [0:0] Disable;
  output  wire [31:0] Output;

  TC_Mux # (.UUID(64'd1596469395249738291 ^ UUID), .BIT_WIDTH(64'd32)) Mux32_0 (.sel(wire_0), .in0(wire_2), .in1(wire_3), .out(wire_1));
  TC_Constant # (.UUID(64'd2623704728755749742 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h10)) Constant32_1 (.out(wire_3));

  wire [0:0] wire_0;
  assign wire_0 = Disable;
  wire [31:0] wire_1;
  assign Output = wire_1;
  wire [31:0] wire_2;
  assign wire_2 = Res_line;
  wire [31:0] wire_3;

endmodule
