vlib work
vcom shift.vhd
vcom tb_shift.vhd
vsim -c work.shift
vcd file demo_setup.vcd
vcd add -r /*
run 40 ns
quit -f
