# compile.tcl — roda com: quartus_sh -t compile.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "hazard"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE hazard.vhd
set_global_assignment -name TOP_LEVEL_ENTITY hazard

# Mapeamento dos sinais para os pinos da placa DE1
set_location_assignment PIN_L22 -to SW0
set_location_assignment PIN_L21 -to SW1
set_location_assignment PIN_M22 -to SW2
set_location_assignment PIN_R20 -to LEDR0
set_location_assignment PIN_R19 -to LEDR1
set_location_assignment PIN_U19 -to LEDR2

export_assignments
execute_flow -compile

project_close
