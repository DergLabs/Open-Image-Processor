onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib c_shift_ram_sync_buffer_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {c_shift_ram_sync_buffer.udo}

run -all

quit -force
