
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

// module reg_LE : reg_LE
module reg_LE
  // synopsys translate_off
  #(parameter reg_log = 1'b1,
    parameter reg_log_name = "LE"
  )
  // synopsys translate_on
  ( input             clock,
    input             ohe_selector_E1,
    input             LE_ler_cntrl_nxtpc_pdg_r_en_in, // std_logic
    input       [1:0] LE_ler_cntrl_nxtpc_pdg_r_a_in, // uint2
    input      [15:0] lew_in, // addr
    input       [1:0] lfw_in, // uint2
    output reg [15:0] ler_out // addr
  );


  reg [15:0] reg_val[0:2];

  reg [15:0] reg_val_next[0:2];

  reg  [2:0] reg_write_enab;


  // synopsys translate_off

  reg [2:0] reg_write_log;
  reg [2:0] old_reg_write_log;
  initial reg_write_log <= {3{1'b0}};
  initial old_reg_write_log <= {3{1'b0}};

  always @ (negedge clock)
  begin : p_reg_LE_log

    integer k;

    if (reg_log)
    begin
      for (k = 0; k <= 2; k = k + 1)
      begin
        if (reg_write_log[k] != old_reg_write_log[k])
        begin
          $fdisplay(tmicro.inst_reg_PC.log_file, "%s[%0d] = %0d", reg_log_name, k, reg_val[k]);
        end
        old_reg_write_log[k] <= reg_write_log[k];
      end
    end
  end
  // synopsys translate_on

  always @ (*)
  begin : p_read_reg_LE

    ler_out = 0;

    // (ler_rd_LE_LE_ler_cntrl_nxtpc_pdg_r_a_LE_ler_cntrl_nxtpc_pdg_r_en)
    if (LE_ler_cntrl_nxtpc_pdg_r_en_in)
    begin
      ler_out = reg_val[LE_ler_cntrl_nxtpc_pdg_r_a_in];
    end

  end

  always @ (*)
  begin : p_write_combin_reg_LE

    integer j;

    reg_write_enab = 0;
    for ( j = 0; j <= 2; j = j + 1)
      reg_val_next[j] = 0;


    if (ohe_selector_E1) // (LE_wr_lew___LE_lew_wad_E1)
    begin
      // [control.n:178]
      reg_write_enab[lfw_in] = 1'b1;
      reg_val_next[lfw_in] = lew_in;
    end

  end

  always @ (posedge clock)
  begin : p_write_reg_LE

    integer j;
    for ( j = 0; j <= 2; j = j + 1)
    begin
      if (reg_write_enab[j])
      begin
        reg_val[j] <= reg_val_next[j];
        // synopsys translate_off
        reg_write_log[j] <= ~reg_write_log[j];
        // synopsys translate_on
      end
    end
  end

endmodule
