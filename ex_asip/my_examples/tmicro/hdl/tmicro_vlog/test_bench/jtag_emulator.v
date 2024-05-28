
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:22 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

module jtag_emulator
  #(parameter ocd_clock_freq = 25)
  ( input      jtag_tdo_in,
    output reg jtag_tck_out,
    output reg jtag_tdi_out,
    output reg jtag_tms_out,
    output reg jtag_trst_out
  );


  initial
  begin
    jtag_trst_out = 1'b0;
    #5 jtag_trst_out = 1'b1;
    $jtag_eval(jtag_tdo_in, jtag_trst_out, jtag_tck_out, jtag_tms_out, jtag_tdi_out, ocd_clock_freq);
  end
endmodule
