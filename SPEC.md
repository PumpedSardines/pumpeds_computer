# Spec for the FR-32 computer

## Registers

14 Int registers

r0 to r13

*Special registers:*
r11 - stack pointer (stores the stack)
r12 - for flags from previous operations
r13 - input output, only used to solve some levels

## Instructions

Every instruction is sent by sending 4 bytes. For many instructions some bytes are unnecessary and will be ignored
(op_code) - (data 0) - (data 1) - (result)

## Op codes
First 4 bits decide what type of data comes next

| 4 bit combination | data 0      | data 1 |
--------------------------------------------
| 0000              | reg         | reg    |
| 0001              | reg         | const  |
| 0010              | const       | reg    |
| 0011              | const       | const  |


Next 4 bits decides type of operation

| 4 bit combination | Op       |
--------------------------------
| 0000              | alu      |
| 0001              | falu     |
| 0010              | cond     |
| 0011              | jump     |
| 0100              | ram_save |
| 0101              | ram_load |


### ALU
Last 8 bits

| 8 bit combination | Op     |
------------------------------
| 0x00              | Add    |
| 0x01              | Sub    |
| 0x02              | And    |
| 0x03              | Or     |
| 0x04              | Nand   |
| 0x05              | Nor    |
| 0x06              | Xor    |
| 0x07              | Shl    |
| 0x08              | Shr    |
| 0x09              | Not    |
| 0x0A              | Neg    |

### FALU
todo

### COND
Last 8 bits

| 8 bit combination | Op     |
------------------------------
| 0x00              | Add    |
| 0x01              | Sub    |
| 0x02              | And    |
| 0x03              | Or     |
| 0x04              | Nand   |
| 0x05              | Nor    |
| 0x06              | Xor    |
| 0x07              | Shl    |
| 0x08              | Shr    |
| 0x09              | Not    |
| 0x0A              | Neg    |
