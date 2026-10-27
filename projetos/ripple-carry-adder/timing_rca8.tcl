# timing_rca8.tcl
# Executar com:
# quartus_sta -t timing_rca8.tcl

package require ::quartus::project

set project_name "rca8"

project_open $project_name

create_timing_netlist
read_sdc
update_timing_netlist

puts "======================================"
puts " TIMING RCA8"
puts "======================================"

report_timing \
    -from [get_ports {A[*] B[*] Cin}] \
    -to [get_ports {S[*] Cout}] \
    -npaths 20 \
    -detail full_path

project_close