# compile.tcl — roda com: quartus_sh -t compile.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "gray_to_binary"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE gray_to_binary.vhd
set_global_assignment -name TOP_LEVEL_ENTITY gray_to_binary

export_assignments
execute_flow -compile

project_close
