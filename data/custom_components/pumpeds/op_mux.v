module op_mux (clk, rst, ALU, Op_code, COND, RAM_1, RAM_2, RET, RES);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [31:0] ALU;
  input  wire [31:0] Op_code;
  input  wire [31:0] COND;
  input  wire [31:0] RAM_1;
  input  wire [31:0] RAM_2;
  input  wire [31:0] RET;
  output  wire [31:0] RES;

  TC_Switch # (.UUID(64'd2833979925024822102 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_0 (.en(wire_8), .in(wire_10), .out(wire_6_0));
  TC_Switch # (.UUID(64'd1389976438385235843 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_1 (.en(wire_3), .in(wire_4), .out(wire_6_1));
  TC_Switch # (.UUID(64'd957473199973768980 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_2 (.en(wire_0), .in(wire_11), .out(wire_6_2));
  TC_Switch # (.UUID(64'd2678588818428267066 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_3 (.en(wire_5), .in(wire_7), .out(wire_6_3));
  op_type # (.UUID(64'd3758995783638921718 ^ UUID)) op_type_4 (.clk(clk), .rst(rst), .Op_code(wire_9), .ALU(wire_8), .FALU(), .COND(wire_3), .JUMP(), .RAM_SAVE(), .RAM_LOAD(wire_0), .HALT(), .STACK_PUSH(), .STACK_POP(wire_5), .CALL(), .RET(wire_2));
  TC_Switch # (.UUID(64'd4428447199202304043 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_5 (.en(wire_2), .in(wire_1), .out(wire_6_4));

  wire [0:0] wire_0;
  wire [31:0] wire_1;
  assign wire_1 = RET;
  wire [0:0] wire_2;
  wire [0:0] wire_3;
  wire [31:0] wire_4;
  assign wire_4 = COND;
  wire [0:0] wire_5;
  wire [31:0] wire_6;
  wire [31:0] wire_6_0;
  wire [31:0] wire_6_1;
  wire [31:0] wire_6_2;
  wire [31:0] wire_6_3;
  wire [31:0] wire_6_4;
  assign wire_6 = wire_6_0|wire_6_1|wire_6_2|wire_6_3|wire_6_4;
  assign RES = wire_6;
  wire [31:0] wire_7;
  assign wire_7 = RAM_2;
  wire [0:0] wire_8;
  wire [31:0] wire_9;
  assign wire_9 = Op_code;
  wire [31:0] wire_10;
  assign wire_10 = ALU;
  wire [31:0] wire_11;
  assign wire_11 = RAM_1;

endmodule
