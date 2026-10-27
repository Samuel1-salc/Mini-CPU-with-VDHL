vlib work
vcom decoder.vhd
vcom ../and_gate/and_gate.vhd
vcom mux4.vhd
vcom MuxDec.vhd
vcom tb_demux.vhd
vsim -c work.tb_demux
vcd file MuxDec.vcd
vcd add -r /*
run 650 ns
quit -f
