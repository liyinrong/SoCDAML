
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

// module ocd_addr_incr : ocd_addr_incr
module ocd_addr_incr
  ( input             ocd_incr_addr_in, // bool
    input      [15:0] ocd_addr_r_in, // addr
    output reg [15:0] ocd_addr_w_out // addr
  );


`include "primitives.v"

  always @ (*)

  begin : p_ocd_addr_incr

    ocd_addr_w_out = 0;


    // (ocd_addr_w_incr_ocd_addr_r_ocd_addr_incr_ocd_incr_addr_alw)
    if (ocd_incr_addr_in)
    begin
      // [ocd_if.n:23]
      addr_incr_addr(ocd_addr_w_out, ocd_addr_r_in);
    end

  end

endmodule
