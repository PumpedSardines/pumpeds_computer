# Cond

Does a condition on input 1 and input 2 and stores 1 in result if the condition is true, otherwise 0

*U_ means unsigned here and I_ means signed since comparisons depend on how the byte is represented*

| 8 bit combination | Op       |
--------------------------------
| 0x00              | EQ       |
| 0x01              | NEQ      |
| 0x02              | U_LT     |
| 0x03              | U_LTE    |
| 0x04              | U_GT     |
| 0x05              | U_GTE    |
| 0x06              | I_LT     |
| 0x07              | I_LTE    |
| 0x08              | I_GT     |
| 0x09              | I_GTE    |
--------------------------------
