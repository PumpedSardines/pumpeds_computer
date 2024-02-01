module inp_addr_mux (clk, rst, Addr_2_1, Addr_1_1, Inp_2, Inp_1, Op_code, Addr_1_2, Addr_2_2);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [31:0] Addr_2_1;
  input  wire [31:0] Addr_1_1;
  input  wire [31:0] Inp_2;
  input  wire [31:0] Inp_1;
  input  wire [31:0] Op_code;
  output  wire [31:0] Addr_1_2;
  output  wire [31:0] Addr_2_2;

  TC_Splitter32 # (.UUID(64'd3039330719504701888 ^ UUID)) Splitter32_0 (.in(wire_8), .out0(), .out1(), .out2(), .out3(wire_9));
  TC_Splitter8 # (.UUID(64'd3563007660395875140 ^ UUID)) Splitter8_1 (.in(wire_9), .out0(), .out1(), .out2(), .out3(), .out4(wire_1), .out5(wire_5), .out6(), .out7());
  TC_Mux # (.UUID(64'd3690585977863913209 ^ UUID), .BIT_WIDTH(64'd32)) Mux32_2 (.sel(wire_5), .in0(wire_0), .in1(wire_7), .out(wire_6));
  TC_Mux # (.UUID(64'd3255739518668057629 ^ UUID), .BIT_WIDTH(64'd32)) Mux32_3 (.sel(wire_1), .in0(wire_3), .in1(wire_4), .out(wire_2));

  wire [31:0] wire_0;
  assign wire_0 = Addr_2_1;
  wire [0:0] wire_1;
  wire [31:0] wire_2;
  assign Addr_1_2 = wire_2;
  wire [31:0] wire_3;
  assign wire_3 = Addr_1_1;
  wire [31:0] wire_4;
  assign wire_4 = Inp_1;
  wire [0:0] wire_5;
  wire [31:0] wire_6;
  assign Addr_2_2 = wire_6;
  wire [31:0] wire_7;
  assign wire_7 = Inp_2;
  wire [31:0] wire_8;
  assign wire_8 = Op_code;
  wire [7:0] wire_9;

endmodule
