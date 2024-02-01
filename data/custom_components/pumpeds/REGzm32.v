module REGzm32 (clk, rst, Reg_Num, Load_addr_1, Load_addr_2, Save_value, Save_reg, Addr_1, Addr_2);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [31:0] Reg_Num;
  input  wire [31:0] Load_addr_1;
  input  wire [31:0] Load_addr_2;
  input  wire [31:0] Save_value;
  input  wire [31:0] Save_reg;
  output  wire [31:0] Addr_1;
  output  wire [31:0] Addr_2;

  TC_Switch # (.UUID(64'd3629241289393683343 ^ UUID), .BIT_WIDTH(64'd32)) Output32z_0 (.en(wire_1), .in(wire_11), .out(Addr_1));
  TC_Switch # (.UUID(64'd2955842744365408518 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_1 (.en(wire_1), .in(wire_4), .out(wire_11));
  TC_Constant # (.UUID(64'd3094649873728203381 ^ UUID), .BIT_WIDTH(64'd1), .value(1'd1)) On_2 (.out(wire_9));
  TC_Equal # (.UUID(64'd736698588183237235 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_3 (.in0(wire_7), .in1(wire_2), .out(wire_0));
  TC_Equal # (.UUID(64'd1611377555782852243 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_4 (.in0(wire_10), .in1(wire_2), .out(wire_5));
  TC_Equal # (.UUID(64'd4055557213177333102 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_5 (.in0(wire_6), .in1(wire_2), .out(wire_1));
  TC_Switch # (.UUID(64'd3683488598652220773 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_6 (.en(wire_5), .in(wire_4), .out(wire_8));
  TC_Switch # (.UUID(64'd3649571465830579382 ^ UUID), .BIT_WIDTH(64'd32)) Output32z_7 (.en(wire_5), .in(wire_8), .out(Addr_2));
  TC_Register # (.UUID(64'd2365239514457715406 ^ UUID), .BIT_WIDTH(64'd32)) Register32_8 (.clk(clk), .rst(rst), .load(wire_9), .save(wire_0), .in(wire_3), .out(wire_4));

  wire [0:0] wire_0;
  wire [0:0] wire_1;
  wire [31:0] wire_2;
  assign wire_2 = Reg_Num;
  wire [31:0] wire_3;
  assign wire_3 = Save_value;
  wire [31:0] wire_4;
  wire [0:0] wire_5;
  wire [31:0] wire_6;
  assign wire_6 = Load_addr_1;
  wire [31:0] wire_7;
  assign wire_7 = Save_reg;
  wire [31:0] wire_8;
  wire [0:0] wire_9;
  wire [31:0] wire_10;
  assign wire_10 = Load_addr_2;
  wire [31:0] wire_11;

endmodule
