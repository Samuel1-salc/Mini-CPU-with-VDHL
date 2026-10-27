# compile.tcl — roda com: quartus_sh -t compile.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "crossbar"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE crossbar.vhd
set_global_assignment -name TOP_LEVEL_ENTITY crossbar

set_location_assignment PIN_L22 -to X1
set_location_assignment PIN_L21 -to X2
set_location_assignment PIN_M22 -to S
set_location_assignment PIN_R20 -to Y1
set_location_assignment PIN_R19 -to Y2
set_location_assignment PIN_R20 -to GND

export_assignments
execute_flow -compile

project_close
