# compile.tcl
# roda com:
# quartus_sh -t compile.tcl

package require ::quartus::project
package require ::quartus::flow

set project_name "cla4"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7

# Arquivos VHDL
set_global_assignment -name VHDL_FILE half_adder.vhd
set_global_assignment -name VHDL_FILE cla.vhd


# Top-level
set_global_assignment -name TOP_LEVEL_ENTITY CARRYLOOK

export_assignments

execute_flow -compile

project_close