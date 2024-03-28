# SynthCraft

Simple modules in systemverilog along with testbenches, built using makefiles.

The ```specs``` directory contains the specifications for the Modules.
The  src and testbenches are in the respective directories.

## How to build the files

Use ```make TARGET=ModuleName```. 
Commands are available to lint, compile, view VDC dumps, and clean

The Makefile and project requres iverilog, Verilator and GTKwave and should be 
availble in your PATH.