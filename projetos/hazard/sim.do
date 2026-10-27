vlib work
vcom hazard.vhd
vcom tb_hazard.vhd
vsim -c work.tb_hazard
vcd file hazard.vcd
vcd add -r /*
run 100 ns
quit -f