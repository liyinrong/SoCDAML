
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

// module mux2 : mux_diid mux_ocd_swbreak_req
module mux2
  ( input      ohe_selector_ID,
    output reg out0 // bool diid ocd_swbreak_req
  );


  always @ (*)

  begin : p_mux2

    out0 = 1'b0; // hw_init // 1:diid 2:ocd_swbreak_req


    if (ohe_selector_ID) // 1:(diid_copy0___CTbool_cstV1_ID)
                         // 2:(ocd_swbreak_req_copy0___CTbool_cstV1_ID)
    begin
      // [move.n:84][control.n:76][control.n:92][control.n:142][control.n:161][control.n:221][control.n:250]
      out0 = 1'b1;
    end

  end

endmodule