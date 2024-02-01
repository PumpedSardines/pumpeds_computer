module op_type (clk, rst, Op_code, ALU, FALU, COND, JUMP, RAM_SAVE, RAM_LOAD, HALT, STACK_PUSH, STACK_POP, CALL, RET);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [31:0] Op_code;
  output  wire [0:0] ALU;
  output  wire [0:0] FALU;
  output  wire [0:0] COND;
  output  wire [0:0] JUMP;
  output  wire [0:0] RAM_SAVE;
  output  wire [0:0] RAM_LOAD;
  output  wire [0:0] HALT;
  output  wire [0:0] STACK_PUSH;
  output  wire [0:0] STACK_POP;
  output  wire [0:0] CALL;
  output  wire [0:0] RET;

  TC_Splitter32 # (.UUID(64'd3627455566731656544 ^ UUID)) Splitter32_0 (.in(wire_20), .out0(), .out1(), .out2(), .out3(wire_24));
  TC_Constant # (.UUID(64'd4326952141901283814 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h0)) Constant8_1 (.out(wire_4));
  TC_Equal # (.UUID(64'd59585662680407589 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_2 (.in0(wire_0), .in1(wire_4), .out(wire_12));
  TC_Constant # (.UUID(64'd287549575435207391 ^ UUID), .BIT_WIDTH(64'd8), .value(8'hF)) Constant8_3 (.out(wire_15));
  TC_And # (.UUID(64'd428116551219435320 ^ UUID), .BIT_WIDTH(64'd8)) And8_4 (.in0(wire_24), .in1(wire_15), .out(wire_0));
  TC_Constant # (.UUID(64'd1711991979982570483 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h1)) Constant8_5 (.out(wire_18));
  TC_Equal # (.UUID(64'd2248592795094681350 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_6 (.in0(wire_0), .in1(wire_18), .out(wire_13));
  TC_Constant # (.UUID(64'd933945281015820147 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h2)) Constant8_7 (.out(wire_17));
  TC_Equal # (.UUID(64'd4111270957214829301 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_8 (.in0(wire_0), .in1(wire_17), .out(wire_10));
  TC_Constant # (.UUID(64'd2935764588149887521 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h3)) Constant8_9 (.out(wire_7));
  TC_Equal # (.UUID(64'd748427662797080075 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_10 (.in0(wire_0), .in1(wire_7), .out(wire_11));
  TC_Constant # (.UUID(64'd175729328240521239 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h4)) Constant8_11 (.out(wire_23));
  TC_Equal # (.UUID(64'd1909735634099083617 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_12 (.in0(wire_0), .in1(wire_23), .out(wire_6));
  TC_Constant # (.UUID(64'd2094222636258966718 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h5)) Constant8_13 (.out(wire_9));
  TC_Equal # (.UUID(64'd2812458993005963706 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_14 (.in0(wire_0), .in1(wire_9), .out(wire_8));
  TC_Constant # (.UUID(64'd2526525314409972974 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h6)) Constant8_15 (.out(wire_21));
  TC_Equal # (.UUID(64'd4504688810692073171 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_16 (.in0(wire_0), .in1(wire_21), .out(wire_19));
  TC_Constant # (.UUID(64'd2974515400227608808 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h7)) Constant8_17 (.out(wire_5));
  TC_Equal # (.UUID(64'd2523724431718828983 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_18 (.in0(wire_0), .in1(wire_5), .out(wire_3));
  TC_Constant # (.UUID(64'd1082957064847959524 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h8)) Constant8_19 (.out(wire_1));
  TC_Equal # (.UUID(64'd25047482795133624 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_20 (.in0(wire_0), .in1(wire_1), .out(wire_25));
  TC_Constant # (.UUID(64'd3039473859491008213 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h9)) Constant8_21 (.out(wire_2));
  TC_Equal # (.UUID(64'd2458123689453323130 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_22 (.in0(wire_0), .in1(wire_2), .out(wire_16));
  TC_Constant # (.UUID(64'd289965445111152360 ^ UUID), .BIT_WIDTH(64'd8), .value(8'hA)) Constant8_23 (.out(wire_22));
  TC_Equal # (.UUID(64'd1271748190365704194 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_24 (.in0(wire_0), .in1(wire_22), .out(wire_14));

  wire [7:0] wire_0;
  wire [7:0] wire_1;
  wire [7:0] wire_2;
  wire [0:0] wire_3;
  assign STACK_PUSH = wire_3;
  wire [7:0] wire_4;
  wire [7:0] wire_5;
  wire [0:0] wire_6;
  assign RAM_SAVE = wire_6;
  wire [7:0] wire_7;
  wire [0:0] wire_8;
  assign RAM_LOAD = wire_8;
  wire [7:0] wire_9;
  wire [0:0] wire_10;
  assign COND = wire_10;
  wire [0:0] wire_11;
  assign JUMP = wire_11;
  wire [0:0] wire_12;
  assign ALU = wire_12;
  wire [0:0] wire_13;
  assign FALU = wire_13;
  wire [0:0] wire_14;
  assign RET = wire_14;
  wire [7:0] wire_15;
  wire [0:0] wire_16;
  assign CALL = wire_16;
  wire [7:0] wire_17;
  wire [7:0] wire_18;
  wire [0:0] wire_19;
  assign HALT = wire_19;
  wire [31:0] wire_20;
  assign wire_20 = Op_code;
  wire [7:0] wire_21;
  wire [7:0] wire_22;
  wire [7:0] wire_23;
  wire [7:0] wire_24;
  wire [0:0] wire_25;
  assign STACK_POP = wire_25;

endmodule