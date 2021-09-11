transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/code/Max10/audio1 {C:/code/Max10/audio1/clock_div.v}
vlog -vlog01compat -work work +incdir+C:/code/Max10/audio1 {C:/code/Max10/audio1/audio1.v}
vlog -vlog01compat -work work +incdir+C:/code/Max10/audio1 {C:/code/Max10/audio1/PLL.v}
vlog -vlog01compat -work work +incdir+C:/code/Max10/audio1 {C:/code/Max10/audio1/i2s_decode.v}
vlog -vlog01compat -work work +incdir+C:/code/Max10/audio1 {C:/code/Max10/audio1/i2s_encode.v}
vlog -vlog01compat -work work +incdir+C:/code/Max10/audio1/db {C:/code/Max10/audio1/db/pll_altpll.v}

