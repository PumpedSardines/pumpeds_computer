# PumpedS computer spec

## Memory
*Preface*: I've never done anything with computers before so all the terminology will wound really dumb :)

The computer has 4 different sources of memory that can be accessed through different means:

- Registers
- Input / Output *(Turing Complete game specific, is used to solve levels in the game)*
- Clock
- Stack (32bit)
- Ram (Each address is 32bit)
- Programmable memory (Each address is 32bit)

There are 13 registers, r0 to r12. 
There are two more *registers*, r13 and r14, which are mapped to input/output and the clock respectively

## Instructions

Every instruction is exactly 128bits long and can be thought of as 4 32bit numbers.
An instruction is divided up into 4 parts, the operation data, inp 1, inp 2 and result:

```[operation data (32bit)][input 1 (32bit)][input 2 (32bit)][result (32bit)]```

Depending on the instruction, input 1, input 2, result will be disregarded.


### Operation data

The operation data can be thought of as first 4 bits specifying the data in input 1 and input 2. And then 4 bits that correspnds to the type of operation.

```
    Type of data in input 1 and 2     Type of operation     Operation data
   ____                               ____                  ____________
0b 0000                               0000                  000000000000
```

Here is a table for how to interpret input 1 and input 2 depending on the first bits:

| 4 bit combination | input 1     | Input 2 |
---------------------------------------------
| 0000              | reg         | reg     |
| 0001              | reg         | immed   |
| 0010              | immed       | reg     |
| 0011              | immed       | const   |
---------------------------------------------

Immediate means that the value in input is a constant value that should be used directly. Otherwise it will index the register with that index. Remember that input/output and the clock are also concidered "registers"



Here is a table of what type of operation has what bit number:

| 4 bit combination | Operation  |
----------------------------------
| 0000              | alu        |
| 0001              | float_alu  |
| 0010              | cond       |
| 0011              | jump       |
| 0100              | ram_save   |
| 0101              | ram_load   |
| 0110              | halt       |
| 0111              | stack_push |
| 1000              | stack_pop  |
| 1001              | call       |
| 1010              | ret        |
----------------------------------


Each operation has it's own file that you can be read more about!
