vlib work
vcom ../lab05/shift.vhd
vcom demo_setup.vhd
vcom tb_demo_setup.vhd
vsim -c work.tb_demo_setup
vcd file demo_setup.vcd
vcd add -r /*
run 40 ns
quit -f
