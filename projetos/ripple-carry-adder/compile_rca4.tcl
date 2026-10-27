# compile_rca4.tcl
# Executar com:
# quartus_sh -t compile_rca4.tcl

package require ::quartus::project
package require ::quartus::flow

set project_name "rca4"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7

# Arquivos VHDL
set_global_assignment -name VHDL_FILE full_adder.vhd
set_global_assignment -name VHDL_FILE rca4.vhd

# Entidade principal
set_global_assignment -name TOP_LEVEL_ENTITY RCA4

export_assignments

execute_flow -compile

project_close