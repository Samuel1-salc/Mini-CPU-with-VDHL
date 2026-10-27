vlib work
vcom crossbar.vhd
vcom tb_crossbar.vhd
vsim -c work.tb_crossbar
vcd file crossbar_switch.vcd
vcd add -r /*
run -all
quit -f
