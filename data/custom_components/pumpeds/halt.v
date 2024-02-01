module halt (clk, rst, OP_CODE, HALT, OK, ERROR);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [31:0] OP_CODE;
  input  wire [0:0] HALT;
  output  wire [0:0] OK;
  output  wire [0:0] ERROR;

  TC_Splitter32 # (.UUID(64'd1971983420989580968 ^ UUID)) Splitter32_0 (.in(wire_3), .out0(wire_8), .out1(), .out2(), .out3());
  TC_Splitter8 # (.UUID(64'd4342802719200797087 ^ UUID)) Splitter8_1 (.in(wire_8), .out0(wire_5), .out1(wire_7), .out2(), .out3(), .out4(), .out5(), .out6(), .out7());
  TC_Decoder3 # (.UUID(64'd1120988638026974164 ^ UUID)) Decoder3_2 (.dis(1'd0), .sel0(wire_5), .sel1(wire_7), .sel2(1'd0), .out0(wire_6), .out1(wire_4), .out2(), .out3(), .out4(), .out5(), .out6(), .out7());
  TC_And # (.UUID(64'd562965331588790443 ^ UUID), .BIT_WIDTH(64'd1)) And_3 (.in0(wire_6), .in1(wire_1), .out(wire_2));
  TC_And # (.UUID(64'd4405332085213227014 ^ UUID), .BIT_WIDTH(64'd1)) And_4 (.in0(wire_4), .in1(wire_1), .out(wire_0));

  wire [0:0] wire_0;
  assign ERROR = wire_0;
  wire [0:0] wire_1;
  assign wire_1 = HALT;
  wire [0:0] wire_2;
  assign OK = wire_2;
  wire [31:0] wire_3;
  assign wire_3 = OP_CODE;
  wire [0:0] wire_4;
  wire [0:0] wire_5;
  wire [0:0] wire_6;
  wire [0:0] wire_7;
  wire [7:0] wire_8;

endmodule
