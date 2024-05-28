
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

// module mux_cbus : mux_cbus
module mux_cbus
  ( input      [1:0] bin_selector_E1,
    input      [1:0] __CTuint2_cstP10_E1_in, // uint2
    output reg [1:0] cbus_out // uint2
  );


  always @ (*)

  begin : p_mux_cbus


    reg    [1:0] __CTuint2_cstP10_E1_in_opd; // uint2

    cbus_out = 0;

    // operand isolation
    if (bin_selector_E1 == 0)
    begin
      __CTuint2_cstP10_E1_in_opd = 0;
    end
    else
    begin
      __CTuint2_cstP10_E1_in_opd = __CTuint2_cstP10_E1_in;
    end


    case (bin_selector_E1)
      2'b01 : // (cbus_copy0___CTuint2_cstV0_E1)
      begin
        // [dma.n:61]
        cbus_out = 2'b00;
      end
      2'b10 : // (cbus_copy0___CTuint2_cstP10_E1)
      begin
        // [dma.n:50]
        cbus_out = __CTuint2_cstP10_E1_in_opd;
      end
      default :
        ; // null
    endcase

  end

endmodule