vlib work
vlog sys_array_tb.v
vsim -c work.sys_array_tb
vcd file wave.vcd
vcd add -r /*
run 80 ns
quit -f
