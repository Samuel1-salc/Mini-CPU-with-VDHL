# compile.tcl
# Executar com:
# quartus_sh -t compile.tcl

package require ::quartus::project
package require ::quartus::flow

set project_name "verilog_test"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7

# Arquivo Verilog. block.v e incluido por systolic_array.v.
set_global_assignment -name VERILOG_FILE systolic_array.v

# Modulo principal
set_global_assignment -name TOP_LEVEL_ENTITY systolic_array

export_assignments

execute_flow -compile

project_close
