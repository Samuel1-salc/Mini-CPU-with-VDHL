vlib work
vcom teste.vhd
vcom tb_teste.vhd
vsim -c work.tb_teste
vcd file teste.vcd
vcd add -r /*
run 100 ns
quit -f