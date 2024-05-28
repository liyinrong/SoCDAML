
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

// module mux_dm_write : mux_dm_write
module mux_dm_write
  ( input              [2:0] bin_selector_E1,
    input                    __ocd_st_DME1_r_in, // bool
    input      signed [15:0] dm_write1_in, // word
    input      signed [15:0] dm_write2_in, // word
    input      signed [15:0] dm_write3_in, // word
    input      signed [15:0] dm_write4_in, // word
    input      signed [15:0] dm_write5_in, // word
    input                    dm_write_rec1_in, // bool
    input                    dm_write_rec2_in, // uint1
    input                    dm_write_rec3_in, // uint1
    input              [1:0] dm_write_rec4_in, // uint2
    input              [2:0] dm_write_rec5_in, // uint3
    input              [7:0] dm_write_rec6_in, // ubyte
    input      signed [15:0] rse1_in, // word
    output reg signed [15:0] dm_write_out // word
  );


  always @ (*)

  begin : p_mux_dm_write


    reg    signed [15:0] dm_write1; // word
    reg    signed [15:0] dm_write2; // word
    reg    signed [15:0] dm_write3; // word
    reg    signed [15:0] dm_write4; // word
    reg    dm_write_rec1; // bool
    reg    dm_write_rec2; // uint1
    reg    dm_write_rec3; // uint1
    reg    [1:0] dm_write_rec4; // uint2
    reg    [2:0] dm_write_rec5; // uint3
    reg    [7:0] dm_write_rec6; // ubyte
    reg    signed [15:0] rse1; // word

    dm_write_out = 0;

    // operand isolation
    if (bin_selector_E1 == 0)
    begin
      dm_write1 = 0;
      dm_write2 = 0;
      dm_write3 = 0;
      dm_write4 = 0;
      rse1 = 0;
      dm_write_rec6 = 0;
      dm_write_rec5 = 0;
      dm_write_rec4 = 0;
      dm_write_rec1 = 0;
      dm_write_rec2 = 0;
      dm_write_rec3 = 0;
    end
    else
    begin
      dm_write1 = dm_write1_in;
      dm_write2 = dm_write2_in;
      dm_write3 = dm_write3_in;
      dm_write4 = dm_write4_in;
      rse1 = rse1_in;
      dm_write_rec6 = dm_write_rec6_in;
      dm_write_rec5 = dm_write_rec5_in;
      dm_write_rec4 = dm_write_rec4_in;
      dm_write_rec1 = dm_write_rec1_in;
      dm_write_rec2 = dm_write_rec2_in;
      dm_write_rec3 = dm_write_rec3_in;
    end


    // (dm_write_copy_dm_write5___ocd_st_DME1_r_E1)
    if (__ocd_st_DME1_r_in)
    begin
      // [ocd_if.n:34]
      dm_write_out = dm_write5_in;
    end

    case (bin_selector_E1)
      3'b001 : // (cp_dm_write_rec_E1)
      begin
        // [load_store.n:57][load_store.n:99](tmicro.n:132)
        dm_write_out = $signed({dm_write_rec6, dm_write_rec5, dm_write_rec4, dm_write_rec3, dm_write_rec2, dm_write_rec1});
      end
      3'b010 : // (dm_write_copy0_rse1_E1)
      begin
        // [load_store.n:57][load_store.n:99](tmicro.n:125)
        dm_write_out = rse1;
      end
      3'b011 : // (dm_write_copy_dm_write1_E1)
      begin
        // [load_store.n:57][load_store.n:99](tmicro.n:134)
        dm_write_out = dm_write1;
      end
      3'b100 : // (dm_write_copy_dm_write2_E1)
      begin
        // [load_store.n:57][load_store.n:99](tmicro.n:135)
        dm_write_out = dm_write2;
      end
      3'b101 : // (dm_write_copy_dm_write3_E1)
      begin
        // [load_store.n:57][load_store.n:99](tmicro.n:131)
        dm_write_out = dm_write3;
      end
      3'b110 : // (dm_write_copy_dm_write4_E1)
      begin
        // [load_store.n:57][load_store.n:99](tmicro.n:130)
        dm_write_out = dm_write4;
      end
      default :
        ; // null
    endcase

  end

endmodule