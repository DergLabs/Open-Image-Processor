onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib c_counter_binary_0_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {c_counter_binary_0.udo}

run -all

quit -force
