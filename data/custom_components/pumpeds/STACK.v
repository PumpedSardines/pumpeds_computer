module STACK (clk, rst, POP, PUSH, Input, OUTPUT);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [0:0] POP;
  input  wire [0:0] PUSH;
  input  wire [31:0] Input;
  output  wire [7:0] OUTPUT;

  TC_Switch # (.UUID(64'd7556522852795915463 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_0 (.en(wire_6), .in(wire_8[7:0]), .out(OUTPUT));
  TC_Ram # (.UUID(64'd4576952316702014465 ^ UUID), .WORD_WIDTH(64'd32), .WORD_COUNT(64'd2050)) Ram_1 (.clk(clk), .rst(rst), .load(wire_6), .save(wire_3), .address(wire_13), .in0({{32{1'b0}}, wire_4 }), .in1(64'd0), .in2(64'd0), .in3(64'd0), .out0(wire_8), .out1(), .out2(), .out3());
  TC_Constant # (.UUID(64'd3175844093545909394 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h1)) Constant32_2 (.out(wire_12));
  TC_Constant # (.UUID(64'd2356890753000811074 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h1)) Constant32_3 (.out(wire_14));
  TC_Neg # (.UUID(64'd3711620706347584958 ^ UUID), .BIT_WIDTH(64'd32)) Neg32_4 (.in(wire_12), .out(wire_11));
  TC_Add # (.UUID(64'd3152567321828051449 ^ UUID), .BIT_WIDTH(64'd32)) Add32_5 (.in0(wire_0), .in1(wire_11), .ci(1'd0), .out(wire_5), .co());
  TC_Add # (.UUID(64'd696116312971148872 ^ UUID), .BIT_WIDTH(64'd32)) Add32_6 (.in0(wire_0), .in1(wire_14), .ci(1'd0), .out(wire_9), .co());
  TC_Or # (.UUID(64'd2362295542422606807 ^ UUID), .BIT_WIDTH(64'd1)) Or_7 (.in0(wire_6), .in1(wire_3), .out(wire_1));
  TC_Switch # (.UUID(64'd2371496659248848397 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_8 (.en(wire_3), .in(wire_9), .out(wire_2_2));
  TC_Switch # (.UUID(64'd3374175381494030941 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_9 (.en(wire_6), .in(wire_5), .out(wire_2_1));
  TC_Nor # (.UUID(64'd1932842366470474600 ^ UUID), .BIT_WIDTH(64'd1)) Nor_10 (.in0(wire_6), .in1(wire_3), .out(wire_7));
  TC_Switch # (.UUID(64'd308716868456052100 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_11 (.en(wire_7), .in(wire_0), .out(wire_2_0));
  TC_Register # (.UUID(64'd3572891934509254860 ^ UUID), .BIT_WIDTH(64'd32)) Register32_12 (.clk(clk), .rst(rst), .load(wire_10), .save(wire_1), .in(wire_2), .out(wire_0));
  TC_Constant # (.UUID(64'd264301759287974657 ^ UUID), .BIT_WIDTH(64'd1), .value(1'd1)) On_13 (.out(wire_10));
  TC_Mux # (.UUID(64'd3378868626776030957 ^ UUID), .BIT_WIDTH(64'd32)) Mux32_14 (.sel(wire_6), .in0(wire_0), .in1(wire_2), .out(wire_13));

  wire [31:0] wire_0;
  wire [0:0] wire_1;
  wire [31:0] wire_2;
  wire [31:0] wire_2_0;
  wire [31:0] wire_2_1;
  wire [31:0] wire_2_2;
  assign wire_2 = wire_2_0|wire_2_1|wire_2_2;
  wire [0:0] wire_3;
  assign wire_3 = PUSH;
  wire [31:0] wire_4;
  assign wire_4 = Input;
  wire [31:0] wire_5;
  wire [0:0] wire_6;
  assign wire_6 = POP;
  wire [0:0] wire_7;
  wire [63:0] wire_8;
  wire [31:0] wire_9;
  wire [0:0] wire_10;
  wire [31:0] wire_11;
  wire [31:0] wire_12;
  wire [31:0] wire_13;
  wire [31:0] wire_14;

endmodule
