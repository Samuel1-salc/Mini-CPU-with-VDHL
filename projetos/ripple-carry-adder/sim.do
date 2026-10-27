vlib work

vcom rca4.vhd
vcom rca8.vhd

vcom tb_rca4.vhd
vcom tb_rca8.vhd


# -------------------------
# Simulacao RCA 4 bits
# -------------------------

vsim -c work.TB_RCA4

vcd file rca4.vcd
vcd add -r /*

run 40 ns

quit -sim


# -------------------------
# Simulacao RCA 8 bits
# -------------------------

vsim -c work.TB_RCA8

vcd file rca8.vcd
vcd add -r /*

run 40 ns

quit -sim

quit -f