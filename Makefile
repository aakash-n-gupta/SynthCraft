# Variables
SRC_DIR := rtl
TEST_DIR := test
BUILD_DIR := build
OUTPUT := output
GTKW := gtkw
TARGET ?= FIFO

# List of Verilog source files
SOURCES := $(wildcard $(SRC_DIR)/$(TARGET).sv)
TESTS 	:= $(wildcard $(TEST_DIR)/$(TARGET)_tb.sv)

# VCD output file
VCD := $(OUTPUT)/$(TARGET).vcd

# Verilog compiler
VERILOG := iverilog
VERILOG_FLAGS += -g2012 -Wall

# Linting tool
# VERILATOR_ROOT = ~/opt/verilator
VERILATOR := verilator

# Flags for verilator
VERILATOR_FLAGS := --lint-only -Wall

# Compile target
compile: $(SOURCES) $(BUILD_DIR)/$(TARGET)

# Rule to create binary
$(BUILD_DIR)/$(TARGET): $(SOURCES) | $(BUILD_DIR)
	$(VERILOG) $(VERILOG_FLAGS) -o $@ $(SOURCES) $(TESTS)

# Rule to run lint
lint: $(SOURCES)
	$(VERILATOR) $(VERILATOR_FLAGS) $(SOURCES)

run: compile $(SOURCES) $(BUILD_DIR)/$(TARGET)
	$(BUILD_DIR)/$(TARGET)

waves: compile run $(OUTPUT)/$(TARGET).vcd
	gtkwave --dark $(OUTPUT)/$(TARGET).vcd $(GTKW)/$(TARGET).gtkw

synth: $(SOURCES)
	yosys -s scripts/synth.ys

# Rule to clean generated files
clean:
	rm -rf $(BUILD_DIR)/$(TARGET) $(OUTPUT)/$(TARGET).vcd

clean-all:
	rm -rf $(BUILD_DIR)/* $(OUTPUT)/*.vcd

.PHONY: compile lint clean run
