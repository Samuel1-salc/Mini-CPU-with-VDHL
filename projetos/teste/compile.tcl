# compile.tcl — roda com: quartus_sh -t compile.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "teste"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE teste.vhd
set_global_assignment -name TOP_LEVEL_ENTITY funcao_5var

# Mapeamento dos sinais para os pinos da placa DE1
set_location_assignment PIN_L22 -to A
set_location_assignment PIN_L21 -to B
set_location_assignment PIN_M22 -to C
set_location_assignment PIN_V12 -to D
set_location_assignment PIN_W12 -to E
set_location_assignment PIN_R20 -to F

export_assignments
execute_flow -compile

project_close
