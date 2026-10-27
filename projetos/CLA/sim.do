vlib work

vcom half_adder.vhd
vcom cla.vhd
vcom cla8.vhd
vcom tb_cla8.vhd

vsim -c work.TB_CLA8

vcd file cla8.vcd
vcd add -r /*

run 40 ns

quit -f