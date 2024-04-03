# Simple Arihemetic-Logic Unit

Takes as input rs1, rs2 and outputs to rd and flag.
Using common register names naming conventions for IOs

Ops Code Table:
| Name  | aluop  | Description |
|-------|--------|-------------|
|  ADD  |  0001  | rd <= rs1 + rs2 |
|  SUB  |  0010  | rd <= rs1 - rs2 |
|  AND  |  0011  | rd <= rs1 & rs2 |
|  SLL  |  0100  | rd <= [rs1 shifted left by (rs2 bits)]  |
|  SRL  |  0101  | rd <= [rs1 shifted right by (rs2 bits)] |
|  SRA  |  0110  | rd <= [rs1 shifted right by (rs2 bits), sign extended]  |
|  SLT  |  0111  | rd <= 1 if rs1 < rs2 else 0 both being signed numbers   |
|  SLTU |  1000  | rd <= 1 if rs1 < rs2 else 0 both being unsigned numbers |
|  SEXT |  1001  | rd <= sign-extended rs1, where rs1 is considered to be of size WIDTH/2 |
|  ZEXT |  1010  | rd <= zero-extended rs1, where rs1 is considered to be of size WIDTH/2 |
|  XOR  |  1011  | rd <= rs1 ^ rs2     |
|  NEG  |  1100  | rd <= negative(rs1) |

Any other opcode is illegal and will set the ILLEGAL flag in the flag output.

## IO Ports

This descripes the IOs for the ALU.

### Inputs
clock: triggers events on positive edge  
resetn: active low reset  
rs1 : input data, WIDTH-1 to 0  
rs2 : input data, WIDTH-1 to 0  
aluop: provide operation to be performed, 4-bit width  

### Outputs
flag: overflow, underflow, illegal aluop. 3-bit width  
rd  : result, WIDTH-1 to 0  

## Behavour

We describe the behavior of the simple area. In the input cycle, input data rs1 and rs2 along with the opcode will be provided to the ALU. The opcode should contain only the allowed values. If an illegal opcode is provided, output will be de-asserted and illegal flag will be set. On reset, the input ports will be ignored and output will be zero as long as the reset is asserted.  
Outputs are registered and the output will be available after a single cycle delay.

The Overflow flag will be set when  rs1 + rs2 > 2 raised to the width. The output will be set to 2^WIDTH -1  
The underflow flag will be set when rs1 - rs2 is less than zero. The output will be set to zero.  
The illegal opcode flag will be set when an illegal opcode is provided, and output will be set to high impedance.  
All the flags will be asserted for one cycle only, when the associated output is available on the O/P ports.

Flag Output

    |ILLEGAL| Addition Overflow | Subtraction Underflow |
    |-------|-------------------|-----------------------|
    | Bit 2 |        Bit 1      |         Bit 0         |

## Additional notes for operations:
 - For the operations where rs2 is not mentioned, the value will be zero.
 - For shift instructions, the shamt, will be taken from least significant log(WIDTH) bits of rs2, the remaining bits of rs2 will be ignored for shift operations.


 reset has higher priority than illegal opcode.


