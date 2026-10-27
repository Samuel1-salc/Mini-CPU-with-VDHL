vlib work
vcom bin_to_dec.vhd
vcom tb_bin_to_dec.vhd
vsim -c work.tb_bin_to_decimal
vcd file bin_to_dec.vcd
vcd add -r /*
run 40 ns
quit -f