
// File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:22 2024
// Copyright 2014-2018 Synopsys, Inc. All rights reserved.
// go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



`timescale 1ns/1ps

// module tb_mem_PM :  tb_mem_PM
module tb_mem_PM
  #(parameter PM_addr_size = 16,
    parameter PM_data_size = 16,
    parameter PM_file = "data.PM",
    parameter PM_id = 0,
    parameter PM_size = 65536,
    parameter reg_log = 1'b1
  )
  ( input         reset,
    input         clock,
    input  [15:0] pm_addr_in, // addr
    input         pm_ld_in, // std_logic
    input         pm_st_in, // std_logic
    input  [15:0] pm_write_in, // iword
    output [15:0] pm_read_out // iword
  );


  reg [15:0] PM[0:PM_size - 1];

  event value_changed;

  wire   [15:0] pm_addr;
  wire   pm_ld;
  reg    [15:0] pm_read;
  wire   pm_st;
  wire   [15:0] pm_write;

  reg [15:0] pm_read_DLY1;
  reg [15:0] pm_addr_DLY1;
  reg pm_st_nval;

  function [15:0] addr_PM (input [15:0] address);
    begin
      addr_PM = address;
      if (address < 0 || address >= PM_size)
      begin
        addr_PM = 0;
      end
    end
  endfunction

  // input/output port assignment
  assign pm_addr = pm_addr_in;
  assign pm_ld = pm_ld_in;
  assign pm_st = pm_st_in;
  assign pm_write = pm_write_in;
  assign pm_read_out = pm_read;

  always @ (posedge clock)
  begin
    pm_read <= pm_read_DLY1;
    pm_addr_DLY1 <= pm_addr;
  end

  always @ (value_changed or
            pm_ld or
            pm_addr)
  begin : mem_read_PM

    integer i;
    pm_read_DLY1 = 0;

    if (pm_ld) // pm_read_ld_PM_pm_addr_ID
    begin
      pm_read_DLY1 = PM[addr_PM(pm_addr)];
    end
    // pm_read_ld_PM_pm_addr_ocd_ld_PM_ID_alw also uses control signal pm_ld
    // pm_read_rd_PM_pm_addr_pm_ld_pdg_en also uses control signal pm_ld
  end

  // Allow change of the memory_init file at runtime:
  reg [255*8:1] appname = PM_file;
  reg [255*8:1] tmp_appname;
  integer appname_file;
  integer appname_scan_file;

  initial begin
    // check for plusarg:
    if ($value$plusargs("appname=%s",tmp_appname)) begin
      appname = {tmp_appname, ".PM"};
    end
    else begin
      // no plusarg found, check for appname.cfg file.
      // Note: Some simulators may print a harmless warning when 
      //       the file is not found. This can be safely ignored.
      appname_file = $fopen("appname.cfg", "r");
      if (appname_file != 0) begin
        if (!$feof(appname_file)) begin
          appname_scan_file = $fscanf(appname_file, "%s", tmp_appname);
          appname = {tmp_appname, ".PM"};
          $fclose(appname_file);
        end
      end
    end
  end

  always @ (posedge reset or posedge clock)
  begin : mem_write_PM

    integer i;
    if (reset)
    begin
      for ( i = 0; i <= PM_size - 1; i = i + 1)
        PM[i] = 0;
      $readmemh(appname, PM);
      -> value_changed;
    end
    else
    begin
      pm_st_nval = 0;

      if (pm_st) // PM_st_pm_write_pm_addr_E1
      begin
        PM[addr_PM(pm_addr)] = pm_write;

        pm_st_nval = 1;
        -> value_changed;
      end
      // PM_st_pm_write_pm_addr___ocd_st_PME1_r_E1_alw also uses control signal pm_st
    end
  end

  always @ (negedge clock)

  begin : mem_log_PM


    if (reg_log)
    begin
      if (pm_st_nval)
      begin
        $fdisplay(test_bench.inst_tmicro.inst_reg_PC.log_file,
                  "PM[%0d] = %0d", addr_PM(pm_addr_DLY1), PM[addr_PM(pm_addr_DLY1)]);

      end

    end
  end

endmodule