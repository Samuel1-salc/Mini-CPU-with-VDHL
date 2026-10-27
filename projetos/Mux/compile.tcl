# compile.tcl — roda com: quartus_sh -t compile.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "shift"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE shift.vhd
set_global_assignment -name TOP_LEVEL_ENTITY shift

set_location_assignment PIN_R20 -to {y[3]}
set_location_assignment PIN_R19 -to {y{2}}
set_location_assignment PIN_U19 -to {y[1]}
set_location_assignment PIN_Y19 -to {y[0]}

set_location_assignment PIN_L22 -to {w[3]}
set_location_assignment PIN_L21 -to {w[2]} 
set_location_assignment PIN_M22 -to {w[1]}
set_location_assignment PIN_V12 -to {w[0]}

set_location_assignment PIN_M1 -to {s[1]}
set_location_assignment PIN_L2 -to {s[0]}

export_assignments
execute_flow -compile

project_close