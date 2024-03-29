module COND (clk, rst, Op_code, Addr_1, Addr_2, Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [31:0] Op_code;
  input  wire [31:0] Addr_1;
  input  wire [31:0] Addr_2;
  output  wire [15:0] Output;

  TC_And # (.UUID(64'd2367903160720416068 ^ UUID), .BIT_WIDTH(64'd64)) And64_0 (.in0({{32{1'b0}}, wire_23 }), .in1({{32{1'b0}}, wire_19 }), .out(wire_1));
  TC_Constant # (.UUID(64'd3702637439539675981 ^ UUID), .BIT_WIDTH(64'd32), .value(32'hFF)) Constant32_1 (.out(wire_19));
  TC_Equal # (.UUID(64'd3307467026970206130 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_2 (.in0(wire_1[31:0]), .in1(wire_7), .out(wire_32));
  TC_Constant # (.UUID(64'd2969093834876989049 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h0)) Constant32_3 (.out(wire_7));
  TC_Equal # (.UUID(64'd982387346584071466 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_4 (.in0(wire_1[31:0]), .in1(wire_22), .out(wire_14));
  TC_Constant # (.UUID(64'd4281366940539241251 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h1)) Constant32_5 (.out(wire_22));
  TC_Equal # (.UUID(64'd1886273917479343232 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_6 (.in0(wire_1[31:0]), .in1(wire_25), .out(wire_35));
  TC_Constant # (.UUID(64'd1036248000938172543 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h2)) Constant32_7 (.out(wire_25));
  TC_Equal # (.UUID(64'd2378019975791647168 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_8 (.in0(wire_1[31:0]), .in1(wire_37), .out(wire_29));
  TC_Constant # (.UUID(64'd3649162839773976333 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h3)) Constant32_9 (.out(wire_37));
  TC_Equal # (.UUID(64'd2683582231972257440 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_10 (.in0(wire_1[31:0]), .in1(wire_36), .out(wire_5));
  TC_Constant # (.UUID(64'd2598932003380171208 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h4)) Constant32_11 (.out(wire_36));
  TC_Equal # (.UUID(64'd3962148131258842660 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_12 (.in0(wire_1[31:0]), .in1(wire_34), .out(wire_48));
  TC_Constant # (.UUID(64'd3292953784274058964 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h5)) Constant32_13 (.out(wire_34));
  TC_Constant # (.UUID(64'd1535763231293589767 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h9)) Constant32_14 (.out(wire_43));
  TC_Equal # (.UUID(64'd3712194815650869653 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_15 (.in0(wire_1[31:0]), .in1(wire_43), .out(wire_39));
  TC_Constant # (.UUID(64'd1980186390380277652 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h8)) Constant32_16 (.out(wire_20));
  TC_Equal # (.UUID(64'd3023334011462849504 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_17 (.in0(wire_1[31:0]), .in1(wire_20), .out(wire_12));
  TC_Constant # (.UUID(64'd1036449072606840649 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h7)) Constant32_18 (.out(wire_21));
  TC_Equal # (.UUID(64'd1804665057419404565 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_19 (.in0(wire_1[31:0]), .in1(wire_21), .out(wire_8));
  TC_Constant # (.UUID(64'd2814141242211950990 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h6)) Constant32_20 (.out(wire_30));
  TC_Equal # (.UUID(64'd2728722859468860567 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_21 (.in0(wire_1[31:0]), .in1(wire_30), .out(wire_41));
  TC_Switch # (.UUID(64'd3631395245435682447 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_22 (.en(wire_5), .in(wire_11), .out(wire_0_3));
  TC_Switch # (.UUID(64'd2106512752710719276 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_23 (.en(wire_29), .in(wire_27), .out(wire_0_4));
  TC_Switch # (.UUID(64'd4328062382924986645 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_24 (.en(wire_35), .in(wire_42), .out(wire_0_6));
  TC_Switch # (.UUID(64'd2414119663817540049 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_25 (.en(wire_14), .in(wire_18), .out(wire_0_8));
  TC_Switch # (.UUID(64'd2705965786763099004 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_26 (.en(wire_32), .in(wire_3), .out(wire_0_9));
  TC_Switch # (.UUID(64'd3817395363590522003 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_27 (.en(wire_48), .in(wire_26), .out(wire_0_2));
  TC_Switch # (.UUID(64'd1937648300388388138 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_28 (.en(wire_41), .in(wire_6), .out(wire_0_0));
  TC_Switch # (.UUID(64'd1417708529893204493 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_29 (.en(wire_8), .in(wire_17), .out(wire_0_1));
  TC_Switch # (.UUID(64'd662175274645363459 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_30 (.en(wire_12), .in(wire_24), .out(wire_0_5));
  TC_Switch # (.UUID(64'd2585050850475972388 ^ UUID), .BIT_WIDTH(64'd1)) Switch1_31 (.en(wire_39), .in(wire_9), .out(wire_0_7));
  TC_Equal # (.UUID(64'd873605594886778610 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_32 (.in0(wire_2), .in1(wire_4), .out(wire_3));
  TC_Equal # (.UUID(64'd321120450146824753 ^ UUID), .BIT_WIDTH(64'd32)) Equal32_33 (.in0(wire_2), .in1(wire_4), .out(wire_15));
  TC_Not # (.UUID(64'd1153739636995511126 ^ UUID), .BIT_WIDTH(64'd1)) Not_34 (.in(wire_15), .out(wire_18));
  TC_LessU # (.UUID(64'd4449325087420009923 ^ UUID), .BIT_WIDTH(64'd32)) LessU32_35 (.in0(wire_2), .in1(wire_4), .out(wire_42));
  TC_LessU # (.UUID(64'd2877657754971763910 ^ UUID), .BIT_WIDTH(64'd32)) LessU32_36 (.in0(wire_2), .in1(wire_4), .out(wire_47));
  TC_Or # (.UUID(64'd1315528528925962457 ^ UUID), .BIT_WIDTH(64'd1)) Or_37 (.in0(wire_3), .in1(wire_47), .out(wire_27));
  TC_LessU # (.UUID(64'd4334423237346651298 ^ UUID), .BIT_WIDTH(64'd32)) LessU32_38 (.in0(wire_2), .in1(wire_4), .out(wire_16));
  TC_Or # (.UUID(64'd3654793789648256898 ^ UUID), .BIT_WIDTH(64'd1)) Or_39 (.in0(wire_3), .in1(wire_16), .out(wire_44));
  TC_Not # (.UUID(64'd2781169241278617494 ^ UUID), .BIT_WIDTH(64'd1)) Not_40 (.in(wire_44), .out(wire_11));
  TC_LessU # (.UUID(64'd2332787927716165051 ^ UUID), .BIT_WIDTH(64'd32)) LessU32_41 (.in0(wire_2), .in1(wire_4), .out(wire_13));
  TC_Not # (.UUID(64'd3178298990231966311 ^ UUID), .BIT_WIDTH(64'd1)) Not_42 (.in(wire_13), .out(wire_26));
  TC_LessI # (.UUID(64'd2607915533497602719 ^ UUID), .BIT_WIDTH(64'd32)) LessI32_43 (.in0(wire_2), .in1(wire_4), .out(wire_6));
  TC_LessI # (.UUID(64'd3707028319571249590 ^ UUID), .BIT_WIDTH(64'd32)) LessI32_44 (.in0(wire_2), .in1(wire_4), .out(wire_45));
  TC_Or # (.UUID(64'd2639240292110442175 ^ UUID), .BIT_WIDTH(64'd1)) Or_45 (.in0(wire_3), .in1(wire_45), .out(wire_17));
  TC_LessI # (.UUID(64'd4467120648370601875 ^ UUID), .BIT_WIDTH(64'd32)) LessI32_46 (.in0(wire_2), .in1(wire_4), .out(wire_38));
  TC_Or # (.UUID(64'd63730884011078975 ^ UUID), .BIT_WIDTH(64'd1)) Or_47 (.in0(wire_3), .in1(wire_38), .out(wire_46));
  TC_Not # (.UUID(64'd4256640951198738894 ^ UUID), .BIT_WIDTH(64'd1)) Not_48 (.in(wire_46), .out(wire_24));
  TC_LessI # (.UUID(64'd1465057364743271386 ^ UUID), .BIT_WIDTH(64'd32)) LessI32_49 (.in0(wire_2), .in1(wire_4), .out(wire_40));
  TC_Or # (.UUID(64'd1586662098763953415 ^ UUID), .BIT_WIDTH(64'd1)) Or_50 (.in0(wire_3), .in1(wire_40), .out(wire_31));
  TC_Not # (.UUID(64'd940566893175721146 ^ UUID), .BIT_WIDTH(64'd1)) Not_51 (.in(wire_31), .out(wire_9));
  TC_Constant # (.UUID(64'd4440188233219387525 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h1)) Constant32_52 (.out(wire_28));
  TC_Constant # (.UUID(64'd1552829580141814001 ^ UUID), .BIT_WIDTH(64'd32), .value(32'h0)) Constant32_53 (.out(wire_33));
  TC_Mux # (.UUID(64'd4272307579269931703 ^ UUID), .BIT_WIDTH(64'd32)) Mux32_54 (.sel(wire_0), .in0(wire_33), .in1(wire_28), .out(wire_10));

  wire [0:0] wire_0;
  wire [0:0] wire_0_0;
  wire [0:0] wire_0_1;
  wire [0:0] wire_0_2;
  wire [0:0] wire_0_3;
  wire [0:0] wire_0_4;
  wire [0:0] wire_0_5;
  wire [0:0] wire_0_6;
  wire [0:0] wire_0_7;
  wire [0:0] wire_0_8;
  wire [0:0] wire_0_9;
  assign wire_0 = wire_0_0|wire_0_1|wire_0_2|wire_0_3|wire_0_4|wire_0_5|wire_0_6|wire_0_7|wire_0_8|wire_0_9;
  wire [63:0] wire_1;
  wire [31:0] wire_2;
  assign wire_2 = Addr_1;
  wire [0:0] wire_3;
  wire [31:0] wire_4;
  assign wire_4 = Addr_2;
  wire [0:0] wire_5;
  wire [0:0] wire_6;
  wire [31:0] wire_7;
  wire [0:0] wire_8;
  wire [0:0] wire_9;
  wire [31:0] wire_10;
  assign Output = wire_10[15:0];
  wire [0:0] wire_11;
  wire [0:0] wire_12;
  wire [0:0] wire_13;
  wire [0:0] wire_14;
  wire [0:0] wire_15;
  wire [0:0] wire_16;
  wire [0:0] wire_17;
  wire [0:0] wire_18;
  wire [31:0] wire_19;
  wire [31:0] wire_20;
  wire [31:0] wire_21;
  wire [31:0] wire_22;
  wire [31:0] wire_23;
  assign wire_23 = Op_code;
  wire [0:0] wire_24;
  wire [31:0] wire_25;
  wire [0:0] wire_26;
  wire [0:0] wire_27;
  wire [31:0] wire_28;
  wire [0:0] wire_29;
  wire [31:0] wire_30;
  wire [0:0] wire_31;
  wire [0:0] wire_32;
  wire [31:0] wire_33;
  wire [31:0] wire_34;
  wire [0:0] wire_35;
  wire [31:0] wire_36;
  wire [31:0] wire_37;
  wire [0:0] wire_38;
  wire [0:0] wire_39;
  wire [0:0] wire_40;
  wire [0:0] wire_41;
  wire [0:0] wire_42;
  wire [31:0] wire_43;
  wire [0:0] wire_44;
  wire [0:0] wire_45;
  wire [0:0] wire_46;
  wire [0:0] wire_47;
  wire [0:0] wire_48;

endmodule
