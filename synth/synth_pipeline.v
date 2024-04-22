/* Generated by Yosys 0.39+4 (git sha1 3231c1cd9, g++ 13.2.1 -O2 -fexceptions -fstack-protector-strong -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -fPIC -Os) */

module Pipeline(clock, resetn, stall, data_in, data_out);
  input clock;
  wire clock;
  input [31:0] data_in;
  wire [31:0] data_in;
  output [31:0] data_out;
  wire [31:0] data_out;
  wire [31:0] data_stage0;
  wire [31:0] data_stage1;
  wire [31:0] data_stage2;
  wire [31:0] data_stage3;
  input resetn;
  wire resetn;
  input stall;
  wire stall;
  \$_SDFFE_PN0N_  \data_stage3_reg[0]  /* _000_ */ (
    .C(clock),
    .D(data_stage2[0]),
    .E(stall),
    .Q(data_stage3[0]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[1]  /* _001_ */ (
    .C(clock),
    .D(data_stage2[1]),
    .E(stall),
    .Q(data_stage3[1]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[2]  /* _002_ */ (
    .C(clock),
    .D(data_stage2[2]),
    .E(stall),
    .Q(data_stage3[2]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[3]  /* _003_ */ (
    .C(clock),
    .D(data_stage2[3]),
    .E(stall),
    .Q(data_stage3[3]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[4]  /* _004_ */ (
    .C(clock),
    .D(data_stage2[4]),
    .E(stall),
    .Q(data_stage3[4]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[5]  /* _005_ */ (
    .C(clock),
    .D(data_stage2[5]),
    .E(stall),
    .Q(data_stage3[5]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[6]  /* _006_ */ (
    .C(clock),
    .D(data_stage2[6]),
    .E(stall),
    .Q(data_stage3[6]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[7]  /* _007_ */ (
    .C(clock),
    .D(data_stage2[7]),
    .E(stall),
    .Q(data_stage3[7]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[8]  /* _008_ */ (
    .C(clock),
    .D(data_stage2[8]),
    .E(stall),
    .Q(data_stage3[8]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[9]  /* _009_ */ (
    .C(clock),
    .D(data_stage2[9]),
    .E(stall),
    .Q(data_stage3[9]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[10]  /* _010_ */ (
    .C(clock),
    .D(data_stage2[10]),
    .E(stall),
    .Q(data_stage3[10]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[11]  /* _011_ */ (
    .C(clock),
    .D(data_stage2[11]),
    .E(stall),
    .Q(data_stage3[11]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[12]  /* _012_ */ (
    .C(clock),
    .D(data_stage2[12]),
    .E(stall),
    .Q(data_stage3[12]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[13]  /* _013_ */ (
    .C(clock),
    .D(data_stage2[13]),
    .E(stall),
    .Q(data_stage3[13]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[14]  /* _014_ */ (
    .C(clock),
    .D(data_stage2[14]),
    .E(stall),
    .Q(data_stage3[14]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[15]  /* _015_ */ (
    .C(clock),
    .D(data_stage2[15]),
    .E(stall),
    .Q(data_stage3[15]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[16]  /* _016_ */ (
    .C(clock),
    .D(data_stage2[16]),
    .E(stall),
    .Q(data_stage3[16]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[17]  /* _017_ */ (
    .C(clock),
    .D(data_stage2[17]),
    .E(stall),
    .Q(data_stage3[17]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[18]  /* _018_ */ (
    .C(clock),
    .D(data_stage2[18]),
    .E(stall),
    .Q(data_stage3[18]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[19]  /* _019_ */ (
    .C(clock),
    .D(data_stage2[19]),
    .E(stall),
    .Q(data_stage3[19]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[20]  /* _020_ */ (
    .C(clock),
    .D(data_stage2[20]),
    .E(stall),
    .Q(data_stage3[20]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[21]  /* _021_ */ (
    .C(clock),
    .D(data_stage2[21]),
    .E(stall),
    .Q(data_stage3[21]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[22]  /* _022_ */ (
    .C(clock),
    .D(data_stage2[22]),
    .E(stall),
    .Q(data_stage3[22]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[23]  /* _023_ */ (
    .C(clock),
    .D(data_stage2[23]),
    .E(stall),
    .Q(data_stage3[23]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[24]  /* _024_ */ (
    .C(clock),
    .D(data_stage2[24]),
    .E(stall),
    .Q(data_stage3[24]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[25]  /* _025_ */ (
    .C(clock),
    .D(data_stage2[25]),
    .E(stall),
    .Q(data_stage3[25]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[26]  /* _026_ */ (
    .C(clock),
    .D(data_stage2[26]),
    .E(stall),
    .Q(data_stage3[26]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[27]  /* _027_ */ (
    .C(clock),
    .D(data_stage2[27]),
    .E(stall),
    .Q(data_stage3[27]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[28]  /* _028_ */ (
    .C(clock),
    .D(data_stage2[28]),
    .E(stall),
    .Q(data_stage3[28]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[29]  /* _029_ */ (
    .C(clock),
    .D(data_stage2[29]),
    .E(stall),
    .Q(data_stage3[29]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[30]  /* _030_ */ (
    .C(clock),
    .D(data_stage2[30]),
    .E(stall),
    .Q(data_stage3[30]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage3_reg[31]  /* _031_ */ (
    .C(clock),
    .D(data_stage2[31]),
    .E(stall),
    .Q(data_stage3[31]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[0]  /* _032_ */ (
    .C(clock),
    .D(data_stage1[0]),
    .E(stall),
    .Q(data_stage2[0]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[1]  /* _033_ */ (
    .C(clock),
    .D(data_stage1[1]),
    .E(stall),
    .Q(data_stage2[1]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[2]  /* _034_ */ (
    .C(clock),
    .D(data_stage1[2]),
    .E(stall),
    .Q(data_stage2[2]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[3]  /* _035_ */ (
    .C(clock),
    .D(data_stage1[3]),
    .E(stall),
    .Q(data_stage2[3]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[4]  /* _036_ */ (
    .C(clock),
    .D(data_stage1[4]),
    .E(stall),
    .Q(data_stage2[4]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[5]  /* _037_ */ (
    .C(clock),
    .D(data_stage1[5]),
    .E(stall),
    .Q(data_stage2[5]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[6]  /* _038_ */ (
    .C(clock),
    .D(data_stage1[6]),
    .E(stall),
    .Q(data_stage2[6]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[7]  /* _039_ */ (
    .C(clock),
    .D(data_stage1[7]),
    .E(stall),
    .Q(data_stage2[7]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[8]  /* _040_ */ (
    .C(clock),
    .D(data_stage1[8]),
    .E(stall),
    .Q(data_stage2[8]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[9]  /* _041_ */ (
    .C(clock),
    .D(data_stage1[9]),
    .E(stall),
    .Q(data_stage2[9]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[10]  /* _042_ */ (
    .C(clock),
    .D(data_stage1[10]),
    .E(stall),
    .Q(data_stage2[10]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[11]  /* _043_ */ (
    .C(clock),
    .D(data_stage1[11]),
    .E(stall),
    .Q(data_stage2[11]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[12]  /* _044_ */ (
    .C(clock),
    .D(data_stage1[12]),
    .E(stall),
    .Q(data_stage2[12]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[13]  /* _045_ */ (
    .C(clock),
    .D(data_stage1[13]),
    .E(stall),
    .Q(data_stage2[13]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[14]  /* _046_ */ (
    .C(clock),
    .D(data_stage1[14]),
    .E(stall),
    .Q(data_stage2[14]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[15]  /* _047_ */ (
    .C(clock),
    .D(data_stage1[15]),
    .E(stall),
    .Q(data_stage2[15]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[16]  /* _048_ */ (
    .C(clock),
    .D(data_stage1[16]),
    .E(stall),
    .Q(data_stage2[16]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[17]  /* _049_ */ (
    .C(clock),
    .D(data_stage1[17]),
    .E(stall),
    .Q(data_stage2[17]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[18]  /* _050_ */ (
    .C(clock),
    .D(data_stage1[18]),
    .E(stall),
    .Q(data_stage2[18]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[19]  /* _051_ */ (
    .C(clock),
    .D(data_stage1[19]),
    .E(stall),
    .Q(data_stage2[19]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[20]  /* _052_ */ (
    .C(clock),
    .D(data_stage1[20]),
    .E(stall),
    .Q(data_stage2[20]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[21]  /* _053_ */ (
    .C(clock),
    .D(data_stage1[21]),
    .E(stall),
    .Q(data_stage2[21]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[22]  /* _054_ */ (
    .C(clock),
    .D(data_stage1[22]),
    .E(stall),
    .Q(data_stage2[22]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[23]  /* _055_ */ (
    .C(clock),
    .D(data_stage1[23]),
    .E(stall),
    .Q(data_stage2[23]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[24]  /* _056_ */ (
    .C(clock),
    .D(data_stage1[24]),
    .E(stall),
    .Q(data_stage2[24]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[25]  /* _057_ */ (
    .C(clock),
    .D(data_stage1[25]),
    .E(stall),
    .Q(data_stage2[25]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[26]  /* _058_ */ (
    .C(clock),
    .D(data_stage1[26]),
    .E(stall),
    .Q(data_stage2[26]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[27]  /* _059_ */ (
    .C(clock),
    .D(data_stage1[27]),
    .E(stall),
    .Q(data_stage2[27]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[28]  /* _060_ */ (
    .C(clock),
    .D(data_stage1[28]),
    .E(stall),
    .Q(data_stage2[28]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[29]  /* _061_ */ (
    .C(clock),
    .D(data_stage1[29]),
    .E(stall),
    .Q(data_stage2[29]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[30]  /* _062_ */ (
    .C(clock),
    .D(data_stage1[30]),
    .E(stall),
    .Q(data_stage2[30]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage2_reg[31]  /* _063_ */ (
    .C(clock),
    .D(data_stage1[31]),
    .E(stall),
    .Q(data_stage2[31]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[0]  /* _064_ */ (
    .C(clock),
    .D(data_stage0[0]),
    .E(stall),
    .Q(data_stage1[0]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[1]  /* _065_ */ (
    .C(clock),
    .D(data_stage0[1]),
    .E(stall),
    .Q(data_stage1[1]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[2]  /* _066_ */ (
    .C(clock),
    .D(data_stage0[2]),
    .E(stall),
    .Q(data_stage1[2]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[3]  /* _067_ */ (
    .C(clock),
    .D(data_stage0[3]),
    .E(stall),
    .Q(data_stage1[3]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[4]  /* _068_ */ (
    .C(clock),
    .D(data_stage0[4]),
    .E(stall),
    .Q(data_stage1[4]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[5]  /* _069_ */ (
    .C(clock),
    .D(data_stage0[5]),
    .E(stall),
    .Q(data_stage1[5]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[6]  /* _070_ */ (
    .C(clock),
    .D(data_stage0[6]),
    .E(stall),
    .Q(data_stage1[6]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[7]  /* _071_ */ (
    .C(clock),
    .D(data_stage0[7]),
    .E(stall),
    .Q(data_stage1[7]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[8]  /* _072_ */ (
    .C(clock),
    .D(data_stage0[8]),
    .E(stall),
    .Q(data_stage1[8]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[9]  /* _073_ */ (
    .C(clock),
    .D(data_stage0[9]),
    .E(stall),
    .Q(data_stage1[9]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[10]  /* _074_ */ (
    .C(clock),
    .D(data_stage0[10]),
    .E(stall),
    .Q(data_stage1[10]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[11]  /* _075_ */ (
    .C(clock),
    .D(data_stage0[11]),
    .E(stall),
    .Q(data_stage1[11]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[12]  /* _076_ */ (
    .C(clock),
    .D(data_stage0[12]),
    .E(stall),
    .Q(data_stage1[12]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[13]  /* _077_ */ (
    .C(clock),
    .D(data_stage0[13]),
    .E(stall),
    .Q(data_stage1[13]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[14]  /* _078_ */ (
    .C(clock),
    .D(data_stage0[14]),
    .E(stall),
    .Q(data_stage1[14]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[15]  /* _079_ */ (
    .C(clock),
    .D(data_stage0[15]),
    .E(stall),
    .Q(data_stage1[15]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[16]  /* _080_ */ (
    .C(clock),
    .D(data_stage0[16]),
    .E(stall),
    .Q(data_stage1[16]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[17]  /* _081_ */ (
    .C(clock),
    .D(data_stage0[17]),
    .E(stall),
    .Q(data_stage1[17]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[18]  /* _082_ */ (
    .C(clock),
    .D(data_stage0[18]),
    .E(stall),
    .Q(data_stage1[18]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[19]  /* _083_ */ (
    .C(clock),
    .D(data_stage0[19]),
    .E(stall),
    .Q(data_stage1[19]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[20]  /* _084_ */ (
    .C(clock),
    .D(data_stage0[20]),
    .E(stall),
    .Q(data_stage1[20]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[21]  /* _085_ */ (
    .C(clock),
    .D(data_stage0[21]),
    .E(stall),
    .Q(data_stage1[21]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[22]  /* _086_ */ (
    .C(clock),
    .D(data_stage0[22]),
    .E(stall),
    .Q(data_stage1[22]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[23]  /* _087_ */ (
    .C(clock),
    .D(data_stage0[23]),
    .E(stall),
    .Q(data_stage1[23]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[24]  /* _088_ */ (
    .C(clock),
    .D(data_stage0[24]),
    .E(stall),
    .Q(data_stage1[24]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[25]  /* _089_ */ (
    .C(clock),
    .D(data_stage0[25]),
    .E(stall),
    .Q(data_stage1[25]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[26]  /* _090_ */ (
    .C(clock),
    .D(data_stage0[26]),
    .E(stall),
    .Q(data_stage1[26]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[27]  /* _091_ */ (
    .C(clock),
    .D(data_stage0[27]),
    .E(stall),
    .Q(data_stage1[27]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[28]  /* _092_ */ (
    .C(clock),
    .D(data_stage0[28]),
    .E(stall),
    .Q(data_stage1[28]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[29]  /* _093_ */ (
    .C(clock),
    .D(data_stage0[29]),
    .E(stall),
    .Q(data_stage1[29]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[30]  /* _094_ */ (
    .C(clock),
    .D(data_stage0[30]),
    .E(stall),
    .Q(data_stage1[30]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage1_reg[31]  /* _095_ */ (
    .C(clock),
    .D(data_stage0[31]),
    .E(stall),
    .Q(data_stage1[31]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[0]  /* _096_ */ (
    .C(clock),
    .D(data_in[0]),
    .E(stall),
    .Q(data_stage0[0]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[1]  /* _097_ */ (
    .C(clock),
    .D(data_in[1]),
    .E(stall),
    .Q(data_stage0[1]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[2]  /* _098_ */ (
    .C(clock),
    .D(data_in[2]),
    .E(stall),
    .Q(data_stage0[2]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[3]  /* _099_ */ (
    .C(clock),
    .D(data_in[3]),
    .E(stall),
    .Q(data_stage0[3]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[4]  /* _100_ */ (
    .C(clock),
    .D(data_in[4]),
    .E(stall),
    .Q(data_stage0[4]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[5]  /* _101_ */ (
    .C(clock),
    .D(data_in[5]),
    .E(stall),
    .Q(data_stage0[5]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[6]  /* _102_ */ (
    .C(clock),
    .D(data_in[6]),
    .E(stall),
    .Q(data_stage0[6]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[7]  /* _103_ */ (
    .C(clock),
    .D(data_in[7]),
    .E(stall),
    .Q(data_stage0[7]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[8]  /* _104_ */ (
    .C(clock),
    .D(data_in[8]),
    .E(stall),
    .Q(data_stage0[8]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[9]  /* _105_ */ (
    .C(clock),
    .D(data_in[9]),
    .E(stall),
    .Q(data_stage0[9]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[10]  /* _106_ */ (
    .C(clock),
    .D(data_in[10]),
    .E(stall),
    .Q(data_stage0[10]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[11]  /* _107_ */ (
    .C(clock),
    .D(data_in[11]),
    .E(stall),
    .Q(data_stage0[11]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[12]  /* _108_ */ (
    .C(clock),
    .D(data_in[12]),
    .E(stall),
    .Q(data_stage0[12]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[13]  /* _109_ */ (
    .C(clock),
    .D(data_in[13]),
    .E(stall),
    .Q(data_stage0[13]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[14]  /* _110_ */ (
    .C(clock),
    .D(data_in[14]),
    .E(stall),
    .Q(data_stage0[14]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[15]  /* _111_ */ (
    .C(clock),
    .D(data_in[15]),
    .E(stall),
    .Q(data_stage0[15]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[16]  /* _112_ */ (
    .C(clock),
    .D(data_in[16]),
    .E(stall),
    .Q(data_stage0[16]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[17]  /* _113_ */ (
    .C(clock),
    .D(data_in[17]),
    .E(stall),
    .Q(data_stage0[17]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[18]  /* _114_ */ (
    .C(clock),
    .D(data_in[18]),
    .E(stall),
    .Q(data_stage0[18]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[19]  /* _115_ */ (
    .C(clock),
    .D(data_in[19]),
    .E(stall),
    .Q(data_stage0[19]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[20]  /* _116_ */ (
    .C(clock),
    .D(data_in[20]),
    .E(stall),
    .Q(data_stage0[20]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[21]  /* _117_ */ (
    .C(clock),
    .D(data_in[21]),
    .E(stall),
    .Q(data_stage0[21]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[22]  /* _118_ */ (
    .C(clock),
    .D(data_in[22]),
    .E(stall),
    .Q(data_stage0[22]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[23]  /* _119_ */ (
    .C(clock),
    .D(data_in[23]),
    .E(stall),
    .Q(data_stage0[23]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[24]  /* _120_ */ (
    .C(clock),
    .D(data_in[24]),
    .E(stall),
    .Q(data_stage0[24]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[25]  /* _121_ */ (
    .C(clock),
    .D(data_in[25]),
    .E(stall),
    .Q(data_stage0[25]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[26]  /* _122_ */ (
    .C(clock),
    .D(data_in[26]),
    .E(stall),
    .Q(data_stage0[26]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[27]  /* _123_ */ (
    .C(clock),
    .D(data_in[27]),
    .E(stall),
    .Q(data_stage0[27]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[28]  /* _124_ */ (
    .C(clock),
    .D(data_in[28]),
    .E(stall),
    .Q(data_stage0[28]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[29]  /* _125_ */ (
    .C(clock),
    .D(data_in[29]),
    .E(stall),
    .Q(data_stage0[29]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[30]  /* _126_ */ (
    .C(clock),
    .D(data_in[30]),
    .E(stall),
    .Q(data_stage0[30]),
    .R(resetn)
  );
  \$_SDFFE_PN0N_  \data_stage0_reg[31]  /* _127_ */ (
    .C(clock),
    .D(data_in[31]),
    .E(stall),
    .Q(data_stage0[31]),
    .R(resetn)
  );
  assign data_out = data_stage3;
endmodule
