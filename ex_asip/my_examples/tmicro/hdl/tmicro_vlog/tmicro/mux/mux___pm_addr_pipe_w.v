
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

// module mux___pm_addr_pipe_w : mux___pm_addr_pipe_w
module mux___pm_addr_pipe_w
  ( input                    ohe_selector_ID,
    input                    ocd_st_PM_in, // bool
    input      signed [15:0] ag1p_in, // word
    input             [15:0] ocd_addr_r_in, // addr
    output reg        [15:0] __pm_addr_pipe_w_out // addr
  );


  always @ (*)

  begin : p_mux___pm_addr_pipe_w


    reg    signed [15:0] ag1p; // word

    __pm_addr_pipe_w_out = 0;

    // operand isolation
    if (ohe_selector_ID == 0)
    begin
      ag1p = 0;
    end
    else
    begin
      ag1p = ag1p_in;
    end


    // (pm_addr_pipe_copy0_ocd_addr_r_ocd_st_PM_ID_alw)
    if (ocd_st_PM_in)
    begin
      // [ocd_if.n:44]
      __pm_addr_pipe_w_out = ocd_addr_r_in;
    end

    if (ohe_selector_ID) // (pm_addr_pipe_copy0_ag1p_ID)
    begin
      // [load_store.n:127]
      __pm_addr_pipe_w_out = $unsigned(ag1p);
    end

  end

endmodule