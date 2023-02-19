SHELL := /bin/zsh

UART := /dev/cu.usbserial-D00137

ENVIRONMENT := source toolchain/oss-cad-suite/environment
PYTHON := python

AS := riscv64-unknown-elf-as
LD := riscv64-unknown-elf-ld
OBJDUMP := riscv64-unknown-elf-objdump

test:
	$(ENVIRONMENT) && $(PYTHON) -m amaranth_boards.ulx3s 85F

blinky: examples/blinky.py
	$(ENVIRONMENT) && $(PYTHON) $<

top: gateware/top.py
	$(ENVIRONMENT) && $(PYTHON) $<

netcat:
	nc -u 192.168.20.250 1735
