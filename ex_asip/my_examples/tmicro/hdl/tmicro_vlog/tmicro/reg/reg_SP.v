
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

// module reg_SP : reg_SP
module reg_SP
  // synopsys translate_off
  #(parameter reg_log = 1'b1,
    parameter reg_log_name = "SP"
  )
  // synopsys translate_on
  ( input                    clock,
    input              [1:0] bin_selector_E1,
    input                    ohe_selector_ID,
    input      signed [15:0] __pm_read_w_SP_in, // word
    input      signed [15:0] ag1q_in, // word
    input      signed [15:0] dm_read_dp_in, // word
    input      signed [15:0] wbus_in, // word
    output reg signed [15:0] __pm_write_r_SP_out, // word
    output reg signed [15:0] ag1p_out, // word
    output reg signed [15:0] dm_write_out, // word
    output reg signed [15:0] wbus_out // word
  );


  reg signed [15:0] reg_val;

  reg signed [15:0] reg_val_next;

  reg  reg_write_enab;


  // synopsys translate_off

  reg reg_write_log;
  reg old_reg_write_log;
  initial reg_write_log     = 1'b0;
  initial old_reg_write_log = 1'b0;

  always @ (negedge clock)
  begin : p_reg_SP_log


    if (reg_log)
    begin
      if (reg_write_log !=old_reg_write_log)
      begin
        $fdisplay(tmicro.inst_reg_PC.log_file, "%s = %0d", reg_log_name, $signed(reg_val));
      end
      old_reg_write_log <= reg_write_log;
    end
  end
  // synopsys translate_on

  always @ (*)
  begin : p_read_reg_SP

    // __pm_write_r_SP_out = 0;
    // ag1p_out = 0;
    // dm_write_out = 0;
    // wbus_out = 0;

    // (wbus_rd_SP_E1)
    // [move.n:48][move.n:96][dma.n:51](tmicro.n:130)
    wbus_out = reg_val;

    // (dm_write_rd_SP_E1)
    // [load_store.n:57][load_store.n:99](tmicro.n:130)
    dm_write_out = reg_val;

    // (__pm_write_r_SP_rd_SP_E1)
    // [load_store.n:130](tmicro.n:130)
    __pm_write_r_SP_out = reg_val;

    // (ag1p_rd_SP_ID)
    // [load_store.n:46][load_store.n:138][load_store.n:145]
    ag1p_out = reg_val;

  end

  always @ (*)
  begin : p_write_combin_reg_SP

    reg_write_enab = 0;
    reg_val_next = 0;


    case (bin_selector_E1)
      2'b01 : // (SP_wr_wbus_E1)
      begin
        // [move.n:48][move.n:55][move.n:62][move.n:106][dma.n:70](tmicro.n:130)
        reg_write_enab = 1'b1;
        reg_val_next = wbus_in;
      end
      2'b10 : // (SP_wr_dm_read_E1)
      begin
        // [load_store.n:51][load_store.n:93](tmicro.n:130)
        reg_write_enab = 1'b1;
        reg_val_next = dm_read_dp_in;
      end
      2'b11 : // (SP_wr___pm_read_w_SP_E1)
      begin
        // [load_store.n:116](tmicro.n:130)
        reg_write_enab = 1'b1;
        reg_val_next = __pm_read_w_SP_in;
      end
      default :
        ; // null
    endcase

    if (ohe_selector_ID) // (SP_wr_ag1q_ID)
    begin
      // [load_store.n:138][load_store.n:145]
      reg_write_enab = 1'b1;
      reg_val_next = ag1q_in;
    end

  end

  always @ (posedge clock)
  begin : p_write_reg_SP

    if (reg_write_enab)
    begin
      reg_val <= reg_val_next;
      // synopsys translate_off
      reg_write_log <= ~reg_write_log;
      // synopsys translate_on
    end
  end

endmodule
