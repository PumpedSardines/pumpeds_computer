module pumpeds (clk, rst, arch_input_enable, arch_input_value, arch_output_enable, arch_output_value);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  output  wire [0:0] arch_input_enable;
  input  wire [7:0] arch_input_value;
  output  wire [0:0] arch_output_enable;
  output  wire [7:0] arch_output_value;

  TC_Program # (.UUID(64'd492330249158909253 ^ UUID), .WORD_WIDTH(64'd32), .DEFAULT_FILE_NAME("Program_6D51BC0CD4BDD45.w32.bin"), .ARG_SIG("Program_6D51BC0CD4BDD45=%s")) Program_0 (.clk(clk), .rst(rst), .address(wire_24[15:0]), .out0(wire_28), .out1(wire_17), .out2(wire_1), .out3(wire_31));
  TC_Constant # (.UUID(64'd832778227662245112 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h0)) Constant32_1 (.out(wire_51));
  TC_Constant # (.UUID(64'd2218624614367548354 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h1)) Constant32_2 (.out(wire_68));
  TC_Constant # (.UUID(64'd1166176467453948686 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h2)) Constant32_3 (.out(wire_43));
  TC_Constant # (.UUID(64'd2096371182486789342 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h3)) Constant32_4 (.out(wire_67));
  TC_Constant # (.UUID(64'd3088595695126556305 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h4)) Constant32_5 (.out(wire_40));
  TC_Constant # (.UUID(64'd9313152845739978 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h5)) Constant32_6 (.out(wire_35));
  TC_Constant # (.UUID(64'd434541420238539825 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h6)) Constant32_7 (.out(wire_20));
  TC_Constant # (.UUID(64'd162776727542835426 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h7)) Constant32_8 (.out(wire_48));
  TC_Constant # (.UUID(64'd1734737573481782209 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h8)) Constant32_9 (.out(wire_8));
  TC_Constant # (.UUID(64'd559296541386288371 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h9)) Constant32_10 (.out(wire_70));
  TC_Constant # (.UUID(64'd1689656716703880596 ^ UUID), .BIT_WIDTH(64'd32), .value(32'hA)) Constant32_11 (.out(wire_37));
  TC_Constant # (.UUID(64'd4484583988193796312 ^ UUID), .BIT_WIDTH(64'd32), .value(32'hB)) Constant32_12 (.out(wire_27));
  TC_Constant # (.UUID(64'd2349417528581171846 ^ UUID), .BIT_WIDTH(64'd32), .value(32'hC)) Constant32_13 (.out(wire_50));
  TC_Ram # (.UUID(64'd2307058609958466567 ^ UUID), .WORD_WIDTH(64'd32), .WORD_COUNT(64'd4096)) RamFast_14 (.clk(clk), .rst(rst), .load(wire_61), .save(wire_47), .address(wire_3), .in0({{32{1'b0}}, wire_36 }), .in1(64'd0), .in2(64'd0), .in3(64'd0), .out0(wire_32), .out1(), .out2(), .out3());
  TC_Counter # (.UUID(64'd4281237571581564787 ^ UUID), .BIT_WIDTH(64'd32), .count(32'd4)) Counter32_15 (.clk(clk), .rst(rst), .save(wire_22), .in(wire_18), .out(wire_24));
  TC_Splitter32 # (.UUID(64'd819975318396224490 ^ UUID)) Splitter32_16 (.in(wire_28[31:0]), .out0(wire_54), .out1(), .out2(), .out3());
  TC_Constant # (.UUID(64'd2217442198484584727 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h0)) Constant8_17 (.out(wire_60));
  TC_Equal # (.UUID(64'd4556622365781261964 ^ UUID), .BIT_WIDTH(64'd8)) Equal8_18 (.in0(wire_54), .in1(wire_60), .out(wire_9));
  TC_Constant # (.UUID(64'd504211278636613370 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h0)) Constant32_19 (.out(wire_55));
  TC_Equal # (.UUID(64'd2589224118571928751 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_20 (.in0(wire_3), .in1(wire_55), .out(wire_53));
  TC_And # (.UUID(64'd847047636775344445 ^ UUID), .BIT_WIDTH(64'd1)) And_21 (.in0(wire_9), .in1(wire_56), .out(wire_13));
  TC_Not # (.UUID(64'd3412245052284115970 ^ UUID), .BIT_WIDTH(64'd1)) Not_22 (.in(wire_53), .out(wire_56));
  TC_And # (.UUID(64'd4516008284271497564 ^ UUID), .BIT_WIDTH(64'd1)) And_23 (.in0(wire_33), .in1(wire_53), .out(wire_57));
  TC_Not # (.UUID(64'd1554523713962802164 ^ UUID), .BIT_WIDTH(64'd1)) Not_24 (.in(wire_9), .out(wire_33));
  TC_Or # (.UUID(64'd1947098725419539867 ^ UUID), .BIT_WIDTH(64'd1)) Or_25 (.in0(wire_57), .in1(wire_13), .out(wire_44));
  TC_And # (.UUID(64'd2331527371921104772 ^ UUID), .BIT_WIDTH(64'd1)) And_26 (.in0(wire_49), .in1(wire_44), .out(wire_2));
  TC_Switch # (.UUID(64'd4158219393033577867 ^ UUID), .BIT_WIDTH(64'd8)) LevelInputArch_27 (.en(wire_63), .in(arch_input_value), .out(wire_64));
  TC_Constant # (.UUID(64'd4360082785839636440 ^ UUID), .BIT_WIDTH(64'd32), .value(32'hD)) Constant32_28 (.out(wire_29));
  TC_Equal # (.UUID(64'd1623075475446676119 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_29 (.in0(wire_17[31:0]), .in1(wire_29), .out(wire_5));
  TC_Equal # (.UUID(64'd4090909518101421788 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_30 (.in0(wire_1[31:0]), .in1(wire_29), .out(wire_11));
  TC_Or # (.UUID(64'd588614252534091941 ^ UUID), .BIT_WIDTH(64'd1)) Or_31 (.in0(wire_5), .in1(wire_11), .out(wire_63));
  TC_Switch # (.UUID(64'd3974504952496349029 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_32 (.en(wire_5), .in(wire_21), .out(wire_4_12));
  TC_Switch # (.UUID(64'd1745710975612822414 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_33 (.en(wire_11), .in(wire_21), .out(wire_14_13));
  TC_Constant # (.UUID(64'd2462041293709662520 ^ UUID), .BIT_WIDTH(64'd32), .value(32'hD)) Constant32_34 (.out(wire_66));
  TC_Equal # (.UUID(64'd4198739316582817300 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_35 (.in0(wire_66), .in1(wire_19), .out(wire_30));
  TC_Switch # (.UUID(64'd1077722902660633044 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_36 (.en(wire_30), .in(wire_0), .out(wire_69));
  TC_IOSwitch # (.UUID(64'd3270053491337488187 ^ UUID), .BIT_WIDTH(64'd8)) LevelOutputArch_37 (.in(wire_69[7:0]), .en(wire_30), .out(arch_output_value));
  TC_Maker32 # (.UUID(64'd3351951017401013547 ^ UUID)) Maker32_38 (.in0(wire_64), .in1(8'd0), .in2(8'd0), .in3(8'd0), .out(wire_21));
  TC_Constant # (.UUID(64'd3923447345305401286 ^ UUID), .BIT_WIDTH(64'd32), .value(32'hE)) Constant32_39 (.out(wire_39));
  TC_Equal # (.UUID(64'd1395664931508427718 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_40 (.in0(wire_17[31:0]), .in1(wire_39), .out(wire_65));
  TC_Equal # (.UUID(64'd3174691793032018922 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_41 (.in0(wire_1[31:0]), .in1(wire_39), .out(wire_10));
  TC_Switch # (.UUID(64'd276942073740487813 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_42 (.en(wire_65), .in(wire_24), .out(wire_4_10));
  TC_Switch # (.UUID(64'd3904810934092201661 ^ UUID), .BIT_WIDTH(64'd32)) Switch32_43 (.en(wire_10), .in(wire_24), .out(wire_14_14));
  TC_Constant # (.UUID(64'd2674020996839107674 ^ UUID), .BIT_WIDTH(64'd32), .value(32'hE)) Constant32_44 (.out(wire_45));
  TC_Equal # (.UUID(64'd3456201112251066097 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_45 (.in0(wire_45), .in1(wire_19), .out(wire_34));
  TC_Mux # (.UUID(64'd2993110152458478006 ^ UUID), .BIT_WIDTH(64'd32)) Mux32_46 (.sel(wire_34), .in0(wire_36), .in1(wire_0), .out(wire_18));
  TC_Halt # (.UUID(64'd857033102887062338 ^ UUID), .HALT_MESSAGE("HALT OK")) Halt_47 (.clk(clk), .rst(rst), .en(wire_42));
  TC_Halt # (.UUID(64'd205155644655994657 ^ UUID), .HALT_MESSAGE("HALT ERROR")) Halt_48 (.clk(clk), .rst(rst), .en(wire_59));
  TC_Or3 # (.UUID(64'd371999406145700062 ^ UUID), .BIT_WIDTH(64'd1)) Or3_49 (.in0(wire_62), .in1(wire_25), .in2(wire_47), .out(wire_23));
  TC_Or # (.UUID(64'd1496359176170410834 ^ UUID), .BIT_WIDTH(64'd1)) Or_50 (.in0(wire_15), .in1(wire_25), .out(wire_16));
  TC_Or3 # (.UUID(64'd4093543166443949360 ^ UUID), .BIT_WIDTH(64'd1)) Or3_51 (.in0(wire_2), .in1(wire_15), .in2(wire_34), .out(wire_22));
  TC_Add # (.UUID(64'd3019375485489987354 ^ UUID), .BIT_WIDTH(64'd32)) Add32_52 (.in0({{24{1'b0}}, wire_12 }), .in1(wire_7), .ci(1'd0), .out(wire_58), .co());
  TC_Constant # (.UUID(64'd3871507966385780693 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h4)) Constant32_53 (.out(wire_7));
  TC_Or # (.UUID(64'd2749910678759837670 ^ UUID), .BIT_WIDTH(64'd1)) Or_54 (.in0(wire_41), .in1(wire_52), .out(wire_6));
  TC_Or # (.UUID(64'd4137437117391903336 ^ UUID), .BIT_WIDTH(64'd1)) Or_55 (.in0(wire_15), .in1(wire_49), .out(wire_62));
  REGzm32 # (.UUID(64'd2308940491068449358 ^ UUID)) REGzm32_56 (.clk(clk), .rst(rst), .Reg_Num(wire_68), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_13), .Addr_2(wire_14_0));
  REGzm32 # (.UUID(64'd1846542985327225567 ^ UUID)) REGzm32_57 (.clk(clk), .rst(rst), .Reg_Num(wire_51), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_14), .Addr_2(wire_14_2));
  resz_dis # (.UUID(64'd2747761994020813246 ^ UUID)) resz_dis_58 (.clk(clk), .rst(rst), .Res_line(wire_31[31:0]), .Disable(wire_23), .Output(wire_19));
  REGzm32 # (.UUID(64'd4147286483688562174 ^ UUID)) REGzm32_59 (.clk(clk), .rst(rst), .Reg_Num(wire_43), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_9), .Addr_2(wire_14_1));
  REGzm32 # (.UUID(64'd1068540299428783634 ^ UUID)) REGzm32_60 (.clk(clk), .rst(rst), .Reg_Num(wire_67), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_8), .Addr_2(wire_14_3));
  REGzm32 # (.UUID(64'd757577754537980485 ^ UUID)) REGzm32_61 (.clk(clk), .rst(rst), .Reg_Num(wire_40), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_7), .Addr_2(wire_14_4));
  REGzm32 # (.UUID(64'd3253020951541738026 ^ UUID)) REGzm32_62 (.clk(clk), .rst(rst), .Reg_Num(wire_35), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_5), .Addr_2(wire_14_5));
  REGzm32 # (.UUID(64'd1599513544807923914 ^ UUID)) REGzm32_63 (.clk(clk), .rst(rst), .Reg_Num(wire_20), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_3), .Addr_2(wire_14_6));
  REGzm32 # (.UUID(64'd3481652090767510190 ^ UUID)) REGzm32_64 (.clk(clk), .rst(rst), .Reg_Num(wire_48), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_1), .Addr_2(wire_14_7));
  REGzm32 # (.UUID(64'd4090197648109549932 ^ UUID)) REGzm32_65 (.clk(clk), .rst(rst), .Reg_Num(wire_8), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_0), .Addr_2(wire_14_8));
  REGzm32 # (.UUID(64'd634047633913757912 ^ UUID)) REGzm32_66 (.clk(clk), .rst(rst), .Reg_Num(wire_70), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_2), .Addr_2(wire_14_9));
  REGzm32 # (.UUID(64'd3035596869954487989 ^ UUID)) REGzm32_67 (.clk(clk), .rst(rst), .Reg_Num(wire_37), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_4), .Addr_2(wire_14_10));
  REGzm32 # (.UUID(64'd610582797668431009 ^ UUID)) REGzm32_68 (.clk(clk), .rst(rst), .Reg_Num(wire_27), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_6), .Addr_2(wire_14_11));
  REGzm32 # (.UUID(64'd2136077288173913920 ^ UUID)) REGzm32_69 (.clk(clk), .rst(rst), .Reg_Num(wire_50), .Load_addr_1(wire_17[31:0]), .Load_addr_2(wire_1[31:0]), .Save_value(wire_0), .Save_reg(wire_19), .Addr_1(wire_4_11), .Addr_2(wire_14_12));
  ALU # (.UUID(64'd1842884763760190101 ^ UUID)) ALU_70 (.clk(clk), .rst(rst), .Op_code(wire_28[31:0]), .Addr_1(wire_3), .Addr_2(wire_36), .Output(wire_38));
  inp_addr_mux # (.UUID(64'd1219950437312605407 ^ UUID)) inp_addr_mux_71 (.clk(clk), .rst(rst), .Addr_2_1(wire_14), .Addr_1_1(wire_4), .Inp_2(wire_1[31:0]), .Inp_1(wire_17[31:0]), .Op_code(wire_28[31:0]), .Addr_1_2(wire_3), .Addr_2_2(wire_36));
  op_mux # (.UUID(64'd3840520241451103658 ^ UUID)) op_mux_72 (.clk(clk), .rst(rst), .ALU({{16{1'b0}}, wire_38 }), .Op_code(wire_28[31:0]), .COND({{16{1'b0}}, wire_26 }), .RAM_1(wire_32[31:0]), .RAM_2({{24{1'b0}}, wire_12 }), .RET(wire_58), .RES(wire_0));
  op_type # (.UUID(64'd3065210921718190588 ^ UUID)) op_type_73 (.clk(clk), .rst(rst), .Op_code(wire_28[31:0]), .ALU(), .FALU(), .COND(), .JUMP(wire_49), .RAM_SAVE(wire_47), .RAM_LOAD(wire_61), .HALT(wire_46), .STACK_PUSH(wire_25), .STACK_POP(wire_41), .CALL(wire_15), .RET(wire_52));
  COND # (.UUID(64'd3804681244595905963 ^ UUID)) COND_74 (.clk(clk), .rst(rst), .Op_code(wire_28[31:0]), .Addr_1(wire_3), .Addr_2(wire_36), .Output(wire_26));
  halt # (.UUID(64'd2031623747875369809 ^ UUID)) halt_75 (.clk(clk), .rst(rst), .OP_CODE(wire_28[31:0]), .HALT(wire_46), .OK(wire_42), .ERROR(wire_59));
  STACK # (.UUID(64'd1386953411893611996 ^ UUID)) STACK_76 (.clk(clk), .rst(rst), .POP(wire_6), .PUSH(wire_16), .Input(wire_3), .OUTPUT(wire_12));
  TC_Console # (.UUID(64'd1024866528945567349 ^ UUID)) Console_77 (.clk(clk), .rst(rst), .offset(32'd0));

  wire [31:0] wire_0;
  wire [63:0] wire_1;
  wire [0:0] wire_2;
  wire [31:0] wire_3;
  wire [31:0] wire_4;
  wire [31:0] wire_4_0;
  wire [31:0] wire_4_1;
  wire [31:0] wire_4_2;
  wire [31:0] wire_4_3;
  wire [31:0] wire_4_4;
  wire [31:0] wire_4_5;
  wire [31:0] wire_4_6;
  wire [31:0] wire_4_7;
  wire [31:0] wire_4_8;
  wire [31:0] wire_4_9;
  wire [31:0] wire_4_10;
  wire [31:0] wire_4_11;
  wire [31:0] wire_4_12;
  wire [31:0] wire_4_13;
  wire [31:0] wire_4_14;
  assign wire_4 = wire_4_0|wire_4_1|wire_4_2|wire_4_3|wire_4_4|wire_4_5|wire_4_6|wire_4_7|wire_4_8|wire_4_9|wire_4_10|wire_4_11|wire_4_12|wire_4_13|wire_4_14;
  wire [0:0] wire_5;
  wire [0:0] wire_6;
  wire [31:0] wire_7;
  wire [31:0] wire_8;
  wire [0:0] wire_9;
  wire [0:0] wire_10;
  wire [0:0] wire_11;
  wire [7:0] wire_12;
  wire [0:0] wire_13;
  wire [31:0] wire_14;
  wire [31:0] wire_14_0;
  wire [31:0] wire_14_1;
  wire [31:0] wire_14_2;
  wire [31:0] wire_14_3;
  wire [31:0] wire_14_4;
  wire [31:0] wire_14_5;
  wire [31:0] wire_14_6;
  wire [31:0] wire_14_7;
  wire [31:0] wire_14_8;
  wire [31:0] wire_14_9;
  wire [31:0] wire_14_10;
  wire [31:0] wire_14_11;
  wire [31:0] wire_14_12;
  wire [31:0] wire_14_13;
  wire [31:0] wire_14_14;
  assign wire_14 = wire_14_0|wire_14_1|wire_14_2|wire_14_3|wire_14_4|wire_14_5|wire_14_6|wire_14_7|wire_14_8|wire_14_9|wire_14_10|wire_14_11|wire_14_12|wire_14_13|wire_14_14;
  wire [0:0] wire_15;
  wire [0:0] wire_16;
  wire [63:0] wire_17;
  wire [31:0] wire_18;
  wire [31:0] wire_19;
  wire [31:0] wire_20;
  wire [31:0] wire_21;
  wire [0:0] wire_22;
  wire [0:0] wire_23;
  wire [31:0] wire_24;
  wire [0:0] wire_25;
  wire [15:0] wire_26;
  wire [31:0] wire_27;
  wire [63:0] wire_28;
  wire [31:0] wire_29;
  wire [0:0] wire_30;
  assign arch_output_enable = wire_30;
  wire [63:0] wire_31;
  wire [63:0] wire_32;
  wire [0:0] wire_33;
  wire [0:0] wire_34;
  wire [31:0] wire_35;
  wire [31:0] wire_36;
  wire [31:0] wire_37;
  wire [15:0] wire_38;
  wire [31:0] wire_39;
  wire [31:0] wire_40;
  wire [0:0] wire_41;
  wire [0:0] wire_42;
  wire [31:0] wire_43;
  wire [0:0] wire_44;
  wire [31:0] wire_45;
  wire [0:0] wire_46;
  wire [0:0] wire_47;
  wire [31:0] wire_48;
  wire [0:0] wire_49;
  wire [31:0] wire_50;
  wire [31:0] wire_51;
  wire [0:0] wire_52;
  wire [0:0] wire_53;
  wire [7:0] wire_54;
  wire [31:0] wire_55;
  wire [0:0] wire_56;
  wire [0:0] wire_57;
  wire [31:0] wire_58;
  wire [0:0] wire_59;
  wire [7:0] wire_60;
  wire [0:0] wire_61;
  wire [0:0] wire_62;
  wire [0:0] wire_63;
  assign arch_input_enable = wire_63;
  wire [7:0] wire_64;
  wire [0:0] wire_65;
  wire [31:0] wire_66;
  wire [31:0] wire_67;
  wire [31:0] wire_68;
  wire [31:0] wire_69;
  wire [31:0] wire_70;

endmodule
