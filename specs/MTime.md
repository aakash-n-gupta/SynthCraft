# MTIME Machine Mode Timer for RISC-V

The MTIME module is basically a Inspired from the RISC-V ISA MTIME machine mode timer discription. So basically this module will model the behavior of the mtime and mtimecmp registers.

A few extra things, which I have added in this is a pre-scaler, and a load signal.


## Prescalar
The prescalar should be power of two value. The system clock will be divided by the pre-scaler value. mtime and mtimecmp will be driven by prescaled clock value.

## IO Signals
The input signals are MTIE, reset, clock, Load, pre-scaler and mtimecmp value. 

There are 2 outputs, the mtime value and MTIP, the which is the machine timer interrupt pending. 

## Behavour
Interrupt enable (MTIE) this is basically an enable pin for the module if the MTIE is not set, The MTIP output interrupt will not be generated. 

Reset clears the value of the mtime and mtimecmp registers. 

The pre-scaler value will only be updated when the load input is asserted. When load is asserted, we need to load the pre-scaler value and the mtimecmp value.

Now the main functionality of the module, as soon as mtime becomes equal to, or greater than the mtimecmp MTIP is asserted, given mtip is set