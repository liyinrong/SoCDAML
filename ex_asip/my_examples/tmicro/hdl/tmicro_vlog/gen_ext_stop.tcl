
# File generated by Go version O-2018.09#f5599cac26#190121, Tue May 28 10:45:22 2024
# Copyright 2014-2018 Synopsys, Inc. All rights reserved.
# go -B -I../lib -F -D__tct_patch__=300 -Verilog -otmicro_vlog -cgo_options.cfg -Itmicro_vlog/tmp_pdg -updg -updg_controller tmicro



while 1 {
    run 10us
    # check for stop token in actual directory:
    if { [file exists ./.EXT_STOP] } {
        finish
        break
    }
}