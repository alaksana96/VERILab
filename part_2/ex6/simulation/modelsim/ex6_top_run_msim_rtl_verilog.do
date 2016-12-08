transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+//icnas2.cc.ic.ac.uk/apl115/VERI/mylib {//icnas2.cc.ic.ac.uk/apl115/VERI/mylib/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+//icnas2.cc.ic.ac.uk/apl115/VERI/mylib {//icnas2.cc.ic.ac.uk/apl115/VERI/mylib/bin2bcd_16.v}
vlog -vlog01compat -work work +incdir+//icnas2.cc.ic.ac.uk/apl115/VERI/part_2/ex6 {//icnas2.cc.ic.ac.uk/apl115/VERI/part_2/ex6/counter_16.v}
vlog -vlog01compat -work work +incdir+//icnas2.cc.ic.ac.uk/apl115/VERI/part_2/ex6 {//icnas2.cc.ic.ac.uk/apl115/VERI/part_2/ex6/ex6_top.v}
vlog -vlog01compat -work work +incdir+//icnas2.cc.ic.ac.uk/apl115/VERI/part_2/ex6 {//icnas2.cc.ic.ac.uk/apl115/VERI/part_2/ex6/clkdiv50.v}

