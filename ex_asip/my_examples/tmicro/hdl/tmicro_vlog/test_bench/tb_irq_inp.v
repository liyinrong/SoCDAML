
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:22 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



// module tb_irq_inp : tb_irq_inp

// File generated by pdg version O-2018.09#f5599cac26#190121, Tue May 28 10:45:21 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// pdg -B -I../lib -I../lib/isg -D__go__ -Verilog -cgo_options.cfg -D__tct_patch__=300 +wtmicro_vlog/tmp_pdg tmicro


`timescale 1ns/1ps

module tb_irq_inp
  ( input            reset,
    input            clock,
    output reg [7:0] ireq_inp_out
  );

  reg         [7:0] toggle;
  reg         [7:0] pdg_update_toggle;
  reg               pdg_we_toggle;

  // process_result
  always @ (*)
  begin : p_process_result

    ireq_inp_out = 0;

    ireq_inp_out = toggle;
  end //p_process_result

  // process_request
  always @ (*)
  begin : p_process_request

    pdg_we_toggle = 1'b0;
    pdg_update_toggle = 0;

    pdg_we_toggle = 1'b1;
    pdg_update_toggle = toggle ^ 8'b00000100;
  end //p_process_request



  always @ (posedge clock or posedge reset)
  begin : p_update_status
    if (reset)
    begin
      toggle <= 8'b00000000;
    end
    else
    begin
      if (pdg_we_toggle)
        toggle <= pdg_update_toggle;
    end
  end // p_update_status

endmodule // tb_irq_inp