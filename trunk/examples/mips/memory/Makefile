
TESTBENCH = `ls -1 t_*.vhdl | sed 's/\(.*\)\..*/\1/'`

GHDL_CMD = ghdl
GHDL_FLAGS  = -fexplicit --std=02 --ieee=synopsys --warn-no-vital-generic
GHDL_SIM_OPT = --stop-time=21us --ieee-asserts=disable
sources = *_pkg.vhdl *.vhdl

# Unix
REMOVE_CMD = rm 

all : compile run

compile :
	$(GHDL_CMD) -a $(GHDL_FLAGS) $(sources) 
	$(GHDL_CMD) -e $(GHDL_FLAGS) $(TESTBENCH)

run :
	$(GHDL_CMD) -r $(GHDL_FLAGS) $(TESTBENCH) $(GHDL_SIM_OPT) --vcd=$(TESTBENCH).vcd 

clean :
	$(GHDL_CMD) --clean
	$(REMOVE_CMD) *.vcd work-obj93.cf
