IVERILOG = iverilog
VVP = vvp

SRC = src/top_module.v src/packet_parser.v src/classifier.v src/control.v sim/testbench.v
OUT = testbench.out

all: $(SRC)
	$(IVERILOG) -o $(OUT) $(SRC)

run: $(OUT)
	$(VVP) $(OUT)

clean:
	rm -f $(OUT)

packet_parser_tb:
	iverilog -g2012 -o sim/packet_parser_tb sim/packet_parser_tb.v src/packet_parser.v
	vvp sim/packet_parser_tb
