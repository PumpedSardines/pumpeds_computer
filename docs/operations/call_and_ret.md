# Call and Return

These are two different operations with different operation numbers but are very closely linked in functionality. 

## Call

Pushes the input 1 onto the stack and then jumps to input 2. Result is disregarded

**NOTE:** For call to work properly input 1 needs to be set to the clock register, nothing is stopping a program from setting their own value.

## Ret

Pops the stack and sets result to the value + 1. Input 1 and input 2 are disregarded.

**NOTE:** For ret to work properly result needs to be set to the clock register, nothing is stopping a program from setting their own value.
