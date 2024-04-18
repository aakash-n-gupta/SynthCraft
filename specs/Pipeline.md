# Pipelined Designs

I have personally, found it quite hard to create testbenches and create testplans for pipelined designs in verilog/systemverilog.
So basically, I have created the simplest pipelined design possible.

An input is given every clock cycle and the correct output (same as the input!) is expected  four cycles later.
Then how do I match these? 

## Pipelined Desing Basic

The design is a simple data buffer, with 4 cycles of delay.

The data input in the first cycle will be avalilabe on the 4th cycle 
without any modifications. 

On reset, the pipeline registers will be flushed.

If the stall signal is asserted, the registers will stop IO operations
and stage registers will retain the values.

## What happens when stall is deasserted?

It is interesting to note the behavour modeled here.

When stall is asserted, the pipeline registers already have their values (input values from previous cycles),
when the stall is de-asserted the old values already stored in the pipeline are first outputed then new input 
values are registered into the pipeline, after the first posedge after stall is deasserted.

In case of a processor pipeline, when the datapath needs to stall, the input data is also expected to stop.
Here, since there is no wrapper to control input data, the design ignores the input data and does not register it.