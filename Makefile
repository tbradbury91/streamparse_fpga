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

