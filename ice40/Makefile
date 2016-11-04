PROJ = fsmctest
PIN_DEF = fsmctest.pcf
DEVICE = hx8k

all: $(PROJ).rpt $(PROJ).bin

%.blif: %.v
	yosys -q -p 'synth_ice40 -top top -blif $@' font.v char_buf.v vga.v $<

%.asc: $(PIN_DEF) %.blif
	arachne-pnr -d $(subst hx,,$(subst lp,,$(DEVICE))) -o $@ -p $^

%.bin: %.asc
	icepack $< $@

%.rpt: %.asc
	icetime -d $(DEVICE) -mtr $@ $<

$(PROJ).blif: font.list

prog: $(PROJ).bin
	iceprog $<

clean:
	rm -f $(PROJ).blif $(PROJ).asc $(PROJ).rpt $(PROJ).bin

.SECONDARY:
.PHONY: all prog clean
