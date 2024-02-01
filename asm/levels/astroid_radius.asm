main:
  mov input r0  ; Load astroid radius into r0
  mov 0 r3      ; Will be used to store the accumulated additions

  loop:         ; Accumulate the sum of 6, r0 times
    eq r0 0 r1  ; If r0 is 0, exit the loop
    jt r1 exit

    add r3 6 r3 ; Add 6 to the accumulator
    sub r0 1 r0 ; Decrement r0 to keep track of how many times we've looped
    jmp loop    ; Jump back to the beginning of the loop

exit:
  mov r3 output ; Store the result in the output register
  jmp main
