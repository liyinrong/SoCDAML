
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

// module alu : alu
module alu
  ( input              [4:0] bin_selector_E1,
    input      signed [15:0] alur_in, // word
    input      signed [15:0] alus_in, // word
    input                    cbr_in, // uint1
    input                    cndr_in, // bool
    input      signed [15:0] mulu_in, // word
    input      signed [15:0] mulv_in, // word
    output reg signed [15:0] alut_out, // word
    output reg               cbw_out, // uint1
    output reg               cndw_out, // bool
    output reg signed [15:0] mulx_out, // word
    output reg signed [15:0] muly_out // word
  );


  parameter sel_eq_word          = 5'b00001;
  parameter sel_ges_word         = 5'b00010;
  parameter sel_geu_word         = 5'b00011;
  parameter sel_gts_word         = 5'b00100;
  parameter sel_gtu_word         = 5'b00101;
  parameter sel_les_word         = 5'b00110;
  parameter sel_leu_word         = 5'b00111;
  parameter sel_lts_word         = 5'b01000;
  parameter sel_ltu_word         = 5'b01001;
  parameter sel_ne_word          = 5'b01010;
  parameter sel_divstep_word     = 5'b01011;
  parameter sel_add_word         = 5'b01100;
  parameter sel_addc_word        = 5'b01101;
  parameter sel_andw_word        = 5'b01110;
  parameter sel_complement_word  = 5'b01111;
  parameter sel_ext_abs_word     = 5'b10000;
  parameter sel_extend_sign_word = 5'b10001;
  parameter sel_maxw_word        = 5'b10010;
  parameter sel_minw_word        = 5'b10011;
  parameter sel_orw_word         = 5'b10100;
  parameter sel_select_bool      = 5'b10101;
  parameter sel_sub_word         = 5'b10110;
  parameter sel_subb_word        = 5'b10111;
  parameter sel_xorw_word        = 5'b11000;

`include "primitives.v"

  always @ (*)

  begin : p_alu


    reg    signed [15:0] alur; // word
    reg    signed [15:0] alus; // word
    reg    cbr; // uint1
    reg    cndr; // bool
    reg    signed [15:0] mulu; // word
    reg    signed [15:0] mulv; // word

    alut_out = 0;
    cbw_out = 0;
    cndw_out = 0;
    mulx_out = 0;
    muly_out = 0;

    // operand isolation
    if (bin_selector_E1 == 0)
    begin
      alur = 0;
      alus = 0;
      mulu = 0;
      mulv = 0;
      cbr = 0;
      cndr = 0;
    end
    else
    begin
      alur = alur_in;
      alus = alus_in;
      mulu = mulu_in;
      mulv = mulv_in;
      cbr = cbr_in;
      cndr = cndr_in;
    end


    case (bin_selector_E1)
      sel_eq_word : // (cndw_eq_alur_alus_alu_E1)
      begin
        // [alu.n:110]
        bool_eq_word_word(cndw_out, alur, alus);
      end
      sel_ges_word : // (cndw_ges_alur_alus_alu_E1)
      begin
        // [alu.n:95]
        bool_ges_word_word(cndw_out, alur, alus);
      end
      sel_geu_word : // (cndw_geu_alur_alus_alu_E1)
      begin
        // [alu.n:96]
        bool_geu_word_word(cndw_out, alur, alus);
      end
      sel_gts_word : // (cndw_gts_alur_alus_alu_E1)
      begin
        // [alu.n:93]
        bool_gts_word_word(cndw_out, alur, alus);
      end
      sel_gtu_word : // (cndw_gtu_alur_alus_alu_E1)
      begin
        // [alu.n:94]
        bool_gtu_word_word(cndw_out, alur, alus);
      end
      sel_les_word : // (cndw_les_alur_alus_alu_E1)
      begin
        // [alu.n:91]
        bool_les_word_word(cndw_out, alur, alus);
      end
      sel_leu_word : // (cndw_leu_alur_alus_alu_E1)
      begin
        // [alu.n:92]
        bool_leu_word_word(cndw_out, alur, alus);
      end
      sel_lts_word : // (cndw_lts_alur_alus_alu_E1)
      begin
        // [alu.n:89]
        bool_lts_word_word(cndw_out, alur, alus);
      end
      sel_ltu_word : // (cndw_ltu_alur_alus_alu_E1)
      begin
        // [alu.n:90]
        bool_ltu_word_word(cndw_out, alur, alus);
      end
      sel_ne_word : // (cndw_ne_alur_alus_alu_E1)
      begin
        // [alu.n:111]
        bool_ne_word_word(cndw_out, alur, alus);
      end
      sel_divstep_word : // (vd_divstep_alur_mulu_mulv_mulx_muly_alu_E1)
      begin
        // [alu.n:232]
        void_divstep_word_word_word_word_word(alur, mulu, mulv, mulx_out, muly_out);
      end
      sel_add_word : // (alut_add_alur_alus_cbw_alu_E1)
      begin
        // [alu.n:68]
        word_add_word_word_uint1(alut_out, alur, alus, cbw_out);
      end
      sel_addc_word : // (alut_addc_alur_alus_cbr_cbw_alu_E1)
      begin
        // [alu.n:69]
        word_addc_word_word_uint1_uint1(alut_out, alur, alus, cbr, cbw_out);
      end
      sel_andw_word : // (alut_andw_alur_alus_alu_E1)
      begin
        // [alu.n:72]
        word_andw_word_word(alut_out, alur, alus);
      end
      sel_complement_word : // (alut_complement_alus_alu_E1)
      begin
        // [alu.n:124]
        word_complement_word(alut_out, alus);
      end
      sel_ext_abs_word : // (alut_ext_abs_alur_alu_E1)
      begin
        // [alu.n:167]
        word_ext_abs_word(alut_out, alur);
      end
      sel_extend_sign_word : // (alut_extend_sign_alus_alu_E1)
      begin
        // [alu.n:125]
        word_extend_sign_word(alut_out, alus);
      end
      sel_maxw_word : // (alut_maxw_alur_alus_alu_E1)
      begin
        // [alu.n:141]
        word_maxw_word_word(alut_out, alur, alus);
      end
      sel_minw_word : // (alut_minw_alur_alus_alu_E1)
      begin
        // [alu.n:140]
        word_minw_word_word(alut_out, alur, alus);
      end
      sel_orw_word : // (alut_orw_alur_alus_alu_E1)
      begin
        // [alu.n:73]
        word_orw_word_word(alut_out, alur, alus);
      end
      sel_select_bool : // (alut_select_cndr_alur_alus_alu_E1)
      begin
        // [alu.n:155]
        word_select_bool_word_word(alut_out, cndr, alur, alus);
      end
      sel_sub_word : // (alut_sub_alur_alus_cbw_alu_E1)
      begin
        // [alu.n:70]
        word_sub_word_word_uint1(alut_out, alur, alus, cbw_out);
      end
      sel_subb_word : // (alut_subb_alur_alus_cbr_cbw_alu_E1)
      begin
        // [alu.n:71]
        word_subb_word_word_uint1_uint1(alut_out, alur, alus, cbr, cbw_out);
      end
      sel_xorw_word : // (alut_xorw_alur_alus_alu_E1)
      begin
        // [alu.n:74]
        word_xorw_word_word(alut_out, alur, alus);
      end
      default :
        ; // null
    endcase

  end

endmodule
