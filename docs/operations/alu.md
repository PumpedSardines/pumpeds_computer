# ALU

The alu operation takes input 1 and input 2 and performs an operation on them. Then it stores the result of that operation in result.

The last part of the operation data constist of what ALU action to perform, they are:

| 8 bit combination | Op     | Note                             |
|-------------------|--------|----------------------------------|
| 0x00              | Add    |                                  |
| 0x01              | Sub    | Input 1 - Input 2                |
| 0x02              | And    |                                  |
| 0x03              | Or     |                                  |
| 0x04              | Nand   |                                  |
| 0x05              | Nor    |                                  |
| 0x06              | Xor    |                                  |
| 0x07              | Shl    | Input 1 is shifted Input 2 times |
| 0x08              | Shr    | Input 1 is shifted Input 2 times |
| 0x09              | Not    | Input 1 is ignored               |
| 0x0A              | Neg    | Input 1 is ignored               |
