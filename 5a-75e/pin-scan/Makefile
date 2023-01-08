TARGET=pin-scan
TOP=top.v
OBJS+=top.v

all: $(TARGET).bit

SYNTH_SRCS=top.v uart_tx.v
SIM_SRCS=top_tb.v top.v uart_tx.v OSCG.v

ifndef PACKAGE
	PACKAGE=CABGA256
endif

$(TARGET).json: $(SYNTH_SRCS) name.hex
	yosys -p 'read_verilog $(SYNTH_SRCS); synth_ecp5 -top top -abc9 -json $@'

$(TARGET).config: $(TARGET).json $(TARGET).lpf
	nextpnr-ecp5 --25k --package $(PACKAGE) --speed 6 --lpf $(TARGET).lpf --json $(TARGET).json --textcfg $(TARGET).config --freq 65

$(TARGET).bit: $(TARGET).config
	ecppack --svf $(TARGET).svf $< $@

$(TARGET).svf : $(TARGET).bit

name.hex $(TARGET).lpf: ECP5U25Pinout.csv
	./gen_lpf.py ECP5U25Pinout.csv $(TARGET).lpf name.hex --package $(PACKAGE)

top_tb: $(SIM_SRCS)
	iverilog -I `yosys-config --datdir/ecp5/` `yosys-config --datdir/ecp5/cells_sim.v` $(SIM_SRCS) -o $@

top_tb.vcd: top_tb name.hex
	./top_tb

clean:
	rm -f *.ys *.json *.config *.svf *.bit *.vcd top_tb name.hex top.lpf


