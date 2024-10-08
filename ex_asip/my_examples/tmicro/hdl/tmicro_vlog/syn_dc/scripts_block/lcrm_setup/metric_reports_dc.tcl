##########################################################################################
# Lynx Compatible Reference Methodology (LCRM) Setup File
# Script: metric_reports_dc.tcl
# Version: M-2016.12-SP4 (July 17, 2017)
# Copyright (C) 2010-2017 Synopsys, Inc. All rights reserved.
##########################################################################################
## DESCRIPTION:
## * This script provides reports which are parsed to create design metrics
## -----------------------------------------------------------------------------

redirect $SEV(rpt_dir)/dc.report_units {
  report_units
}

redirect $SEV(rpt_dir)/dc.report_qor {
  report_qor
  report_qor -summary
}

redirect $SEV(rpt_dir)/dc.report_threshold_voltage_group {
  report_threshold_voltage_group
}

if { [info exists DCRM_MCMM_SCENARIOS_SETUP_FILE] && [all_active_scenarios]!="" } {
  # evidence of MCMM enabled in DC
  redirect $SEV(rpt_dir)/dc.report_power {
    report_power -nosplit -scenarios [all_active_scenarios]
  }
} else {
  redirect $SEV(rpt_dir)/dc.report_power {
    report_power -nosplit
  }
}

if { [shell_is_in_topographical_mode] } {
  redirect $SEV(rpt_dir)/dc.report_congestion {
    report_congestion
  }
}

## -----------------------------------------------------------------------------
## End of File
## -----------------------------------------------------------------------------




