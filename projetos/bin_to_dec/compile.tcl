# compile.tcl — roda com: quartus_sh -t compile.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "bin_to_dec"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE bin_to_dec.vhd
set_global_assignment -name TOP_LEVEL_ENTITY bin_to_decimal

set_location_assignment PIN_J2 -to segments[0]
set_location_assignment PIN_J1 -to segments[1]
set_location_assignment PIN_H2 -to segments[2]
set_location_assignment PIN_H1 -to segments[3]
set_location_assignment PIN_F2 -to segments[4]
set_location_assignment PIN_F1 -to segments[5]
set_location_assignment PIN_E2 -to segments[6]

export_assignments
execute_flow -compile

project_close
