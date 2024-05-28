
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

// module reg_IE : reg_IE
module reg_IE
  // synopsys translate_off
  #(parameter reg_log = 1'b1,
    parameter reg_log_name = "IE"
  )
  // synopsys translate_on
  ( input            reset,
    input            clock,
    input      [2:0] bin_selector_E1,
    input            __pm_read_w_SR_el2_in, // uint1
    input            dm_read_rec3_in, // uint1
    input            iew_in, // uint1
    input            wbus_rec10_in, // uint1
    output reg       __pm_write_r_SR_el2_out, // uint1
    output reg       dm_write_rec3_out, // uint1
    output reg       ier_out, // uint1
    output reg       wbus_rec3_out // uint1
  );


  reg reg_val;

  reg reg_val_next;

  reg  reg_write_enab;


  // synopsys translate_off

  reg reg_write_log;
  reg old_reg_write_log;

  always @ (negedge clock or posedge reset)
  begin : p_reg_IE_log


    if (reset)
    begin
      old_reg_write_log <= 1'b0;
    end
    else
    begin
      if (reg_log)
      begin
        if (reg_write_log !=old_reg_write_log)
        begin
          $fdisplay(tmicro.inst_reg_PC.log_file, "%s = %0d", reg_log_name, reg_val);
        end
        old_reg_write_log <= reg_write_log;
      end
    end
  end
  // synopsys translate_on

  always @ (*)
  begin : p_read_reg_IE

    // __pm_write_r_SR_el2_out = 0;
    // dm_write_rec3_out = 0;
    // ier_out = 0;
    // wbus_rec3_out = 0;

    // (wbus_rd_SR_E1_t2)
    // [move.n:48][move.n:96][control.n:225][dma.n:51](tmicro.n:132)
    wbus_rec3_out = reg_val;

    // (dm_write_rd_SR_E1_t2)
    // [load_store.n:57][load_store.n:99](tmicro.n:132)
    dm_write_rec3_out = reg_val;

    // (__pm_write_r_SR_rd_SR_E1_t2)
    // [load_store.n:130](tmicro.n:132)
    __pm_write_r_SR_el2_out = reg_val;

    // (ier_rd_IE)
    ier_out = reg_val;

  end

  always @ (*)
  begin : p_write_combin_reg_IE

    reg_write_enab = 0;
    reg_val_next = 0;


    case (bin_selector_E1)
      3'b001 : // (IE_wr_iew_E1)
      begin
        // [move.n:76][move.n:87][control.n:224]
        reg_write_enab = 1'b1;
        reg_val_next = iew_in;
      end
      3'b010 : // (SR_wr_wbus_E1_t2)
      begin
        // [move.n:48][move.n:55][move.n:62][move.n:106][control.n:238][dma.n:70](tmicro.n:132)
        reg_write_enab = 1'b1;
        reg_val_next = wbus_rec10_in;
      end
      3'b011 : // (SR_wr_dm_read_E1_t2)
      begin
        // [load_store.n:51][load_store.n:93](tmicro.n:132)
        reg_write_enab = 1'b1;
        reg_val_next = dm_read_rec3_in;
      end
      3'b100 : // (SR_wr___pm_read_w_SR_E1_t2)
      begin
        // [load_store.n:116](tmicro.n:132)
        reg_write_enab = 1'b1;
        reg_val_next = __pm_read_w_SR_el2_in;
      end
      default :
        ; // null
    endcase

  end

  always @ (posedge clock or posedge reset)
  begin : p_write_reg_IE

    if (reset)
    begin
      // synopsys translate_off
      reg_write_log <= 1'b0;
      // synopsys translate_on
      reg_val <= 1'd0;
    end
    else
    begin
      if (reg_write_enab)
      begin
        reg_val <= reg_val_next;
        // synopsys translate_off
        reg_write_log <= ~reg_write_log;
        // synopsys translate_on
      end
    end
  end

endmodule