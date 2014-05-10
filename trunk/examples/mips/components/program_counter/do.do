vlib work
vmap work work
vcom -work work *.vhdl
vsim work.t_program_counter 
add wave -radix hexadecimal sim:/t_program_counter/*
run 200 ns
