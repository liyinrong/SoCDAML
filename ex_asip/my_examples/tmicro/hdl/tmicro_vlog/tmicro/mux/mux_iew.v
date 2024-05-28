
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

// module mux_iew : mux_iew
module mux_iew
  ( input      [1:0] bin_selector_E1,
    output reg       iew_out // uint1
  );


  always @ (*)

  begin : p_mux_iew

    iew_out = 0;


    case (bin_selector_E1)
      2'b01 : // (iew_copy0___CTuint1_cstV0_E1)
      begin
        // [move.n:87][control.n:224]
        iew_out = 1'b0;
      end
      2'b10 : // (iew_copy0___CTuint1_cstV1_E1)
      begin
        // [move.n:76]
        iew_out = 1'b1;
      end
      default :
        ; // null
    endcase

  end

endmodule
