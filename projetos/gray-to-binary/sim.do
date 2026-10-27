vlib work
vcom gray_to_binary.vhd
vcom tb_gray_to_binary.vhd
vsim -c work.tb_gray_to_binary
vcd file gray_to_binary.vcd
vcd add -r /*
run 160 ns
quit -f