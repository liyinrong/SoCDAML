
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:22 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

module jtag_tap_controller
  ( input             jtag_trst,
    input      [31:0] jtag_tap_si_in,
    input             jtag_tck_in,
    input             jtag_tdi_in,
    input             jtag_tms_in,
    output reg        jtag_capture_dr_out,
    output     [15:0] jtag_ireg_out,
    output reg        jtag_shift_dr_out,
    output            jtag_tap_so_out,
    output            jtag_tdo_out,
    output reg        jtag_update_dr_out,
    output reg        jtag_update_ir_out
  );



  // JTAG reserved instructions
  parameter JTAG_EXTEST_INSTR      = 16'b0000000000000000;
  parameter JTAG_RESERVED_INSTR    = 16'b0000000000000001;
  parameter JTAG_IDCODE_INSTR      = 16'b0000000000000010;
  parameter JTAG_BYPASS_INSTR      = 16'b1111111111111111;

  // JTAG TAP state encodings
  parameter TEST_LOGIC_RESET_STATE = 4'b0000;
  parameter RUN_TEST_IDLE_STATE    = 4'b0001;
  parameter SELECT_DR_SCAN_STATE   = 4'b0010;
  parameter CAPTURE_DR_STATE       = 4'b0011;
  parameter SHIFT_DR_STATE         = 4'b0100;
  parameter EXIT1_DR_STATE         = 4'b0101;
  parameter PAUSE_DR_STATE         = 4'b0110;
  parameter EXIT2_DR_STATE         = 4'b0111;
  parameter UPDATE_DR_STATE        = 4'b1000;
  parameter SELECT_IR_SCAN_STATE   = 4'b1001;
  parameter CAPTURE_IR_STATE       = 4'b1010;
  parameter SHIFT_IR_STATE         = 4'b1011;
  parameter EXIT1_IR_STATE         = 4'b1100;
  parameter PAUSE_IR_STATE         = 4'b1101;
  parameter EXIT2_IR_STATE         = 4'b1110;
  parameter UPDATE_IR_STATE        = 4'b1111;

  reg    [15:0] jtag_ireg_master;
  reg    [15:0] jtag_ireg_sig;
  reg    [15:0] jtag_ireg_slave;
  reg    jtag_tdo_sig;
  reg    [3:0] next_state;
  reg    [3:0] state;
  reg    jtag_tdi_REG;
  reg    jtag_tdo_REG;
  reg    jtag_tdo_en_REG;


  // output assignments
  assign jtag_ireg_out = jtag_ireg_slave;
  assign jtag_tap_so_out = jtag_tdi_in;

  // JTAG Finite State Machine
  always @ (posedge jtag_tck_in or negedge jtag_trst)
  begin: state_update_proc
    if (!jtag_trst)
      state <= TEST_LOGIC_RESET_STATE;
    else
      state <= next_state;
  end

  always @ (*)
  begin: next_state_proc
    next_state = TEST_LOGIC_RESET_STATE;
    case (state)
      TEST_LOGIC_RESET_STATE :
        if (jtag_tms_in)
          next_state = TEST_LOGIC_RESET_STATE;
        else
          next_state = RUN_TEST_IDLE_STATE;
      RUN_TEST_IDLE_STATE :
        if (jtag_tms_in)
          next_state = SELECT_DR_SCAN_STATE;
        else
          next_state = RUN_TEST_IDLE_STATE;
      SELECT_DR_SCAN_STATE :
        if (jtag_tms_in)
          next_state = SELECT_IR_SCAN_STATE;
        else
          next_state = CAPTURE_DR_STATE;
      CAPTURE_DR_STATE :
        if (jtag_tms_in)
          next_state = EXIT1_DR_STATE;
        else
          next_state = SHIFT_DR_STATE;
      SHIFT_DR_STATE :
        if (jtag_tms_in)
          next_state = EXIT1_DR_STATE;
        else
          next_state = SHIFT_DR_STATE;
      EXIT1_DR_STATE :
        if (jtag_tms_in)
          next_state = UPDATE_DR_STATE;
        else
          next_state = PAUSE_DR_STATE;
      PAUSE_DR_STATE :
        if (jtag_tms_in)
          next_state = EXIT2_DR_STATE;
        else
          next_state = PAUSE_DR_STATE;
      EXIT2_DR_STATE :
        if (jtag_tms_in)
          next_state = UPDATE_DR_STATE;
        else
          next_state = SHIFT_DR_STATE;
      UPDATE_DR_STATE :
        if (jtag_tms_in)
          next_state = SELECT_DR_SCAN_STATE;
        else
          next_state = RUN_TEST_IDLE_STATE;
      SELECT_IR_SCAN_STATE :
        if (jtag_tms_in)
          next_state = TEST_LOGIC_RESET_STATE;
        else
          next_state = CAPTURE_IR_STATE;
      CAPTURE_IR_STATE :
        if (jtag_tms_in)
          next_state = EXIT1_IR_STATE;
        else
          next_state = SHIFT_IR_STATE;
      SHIFT_IR_STATE :
        if (jtag_tms_in)
          next_state = EXIT1_IR_STATE;
        else
          next_state = SHIFT_IR_STATE;
      EXIT1_IR_STATE :
        if (jtag_tms_in)
          next_state = UPDATE_IR_STATE;
        else
          next_state = PAUSE_IR_STATE;
      PAUSE_IR_STATE :
        if (jtag_tms_in)
          next_state = EXIT2_IR_STATE;
        else
          next_state = PAUSE_IR_STATE;
      EXIT2_IR_STATE :
        if (jtag_tms_in)
          next_state = UPDATE_IR_STATE;
        else
          next_state = SHIFT_IR_STATE;
      UPDATE_IR_STATE :
        if (jtag_tms_in)
          next_state = SELECT_DR_SCAN_STATE;
        else
          next_state = RUN_TEST_IDLE_STATE;
      default :
        ; // null
    endcase
  end

  // JTAG instruction scan register
  always @ (*)
  begin : jtag_ireg_master_input
    integer i;
    jtag_ireg_sig = 0;
    jtag_tdo_sig = 0;
    if (state == CAPTURE_IR_STATE)
      jtag_ireg_sig = JTAG_RESERVED_INSTR;
    else if (state == SHIFT_IR_STATE)
    begin
      jtag_tdo_sig = jtag_ireg_master[0];
      for (i = 0; i < 15; i = i+1)
        jtag_ireg_sig[i] = jtag_ireg_master[i+1];
      jtag_ireg_sig[15] = jtag_tdi_in;
    end
  end

  always @ (posedge jtag_tck_in)
  begin : clock_jtag_ireg_master
    if (state == CAPTURE_IR_STATE || state == SHIFT_IR_STATE)
      jtag_ireg_master <= jtag_ireg_sig;
  end

  always @ (negedge jtag_tck_in)
  begin : clock_jtag_ireg_slave
    if (state == UPDATE_IR_STATE)
      jtag_ireg_slave <= jtag_ireg_master;
  end

  // control for data scan registers
  always @ (*)
  begin : data_scan_reg_control
    jtag_capture_dr_out = 1'b0;
    jtag_update_dr_out = 1'b0;
    jtag_shift_dr_out = 1'b0;
    jtag_update_ir_out = 1'b0;
    if (state == CAPTURE_DR_STATE)
      jtag_capture_dr_out = 1'b1;
    if (state == UPDATE_DR_STATE)
      jtag_update_dr_out = 1'b1;
    if (state == SHIFT_DR_STATE)
      jtag_shift_dr_out = 1'b1;
    if (state == UPDATE_IR_STATE)
      jtag_update_ir_out = 1'b1;
  end

  // sample tdi for bypass
  always @ (posedge jtag_tck_in)
  begin: jtag_tdi_in_reg
    if (jtag_ireg_slave == JTAG_BYPASS_INSTR)
    begin
      if (state == CAPTURE_DR_STATE)
        jtag_tdi_REG <= 1'b0;
      else if (state == SHIFT_DR_STATE)
        jtag_tdi_REG <= jtag_tdi_in;
    end
  end

  // multiplexing and output for tdo
  always @ (negedge jtag_tck_in)
  begin: jtag_tdo_out_reg
    if (state == SHIFT_DR_STATE)
    begin
      if (jtag_ireg_slave == JTAG_BYPASS_INSTR)
        jtag_tdo_REG <= jtag_tdi_REG;
      else
        jtag_tdo_REG <= jtag_tap_si_in[jtag_ireg_slave[15:11]];
    end
    else if(state == SHIFT_IR_STATE)
      jtag_tdo_REG <= jtag_tdo_sig;
  end

  always @ (negedge jtag_tck_in)
  begin: jtag_tdo_en_REG_proc
    if (state == SHIFT_DR_STATE || state == SHIFT_IR_STATE)
      jtag_tdo_en_REG <= 1'b1;
    else
      jtag_tdo_en_REG <= 1'b0;
  end

  assign jtag_tdo_out = jtag_tdo_en_REG? jtag_tdo_REG: 1'bz;

endmodule
