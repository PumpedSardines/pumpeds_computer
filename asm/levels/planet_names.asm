loop:
  mov input r3

  eq 32 r3 r4  ; Is space?
  jf r4 skip_reset_r2
  mov 0 r2     ; Reset has letter before
  jmp next_letter
  skip_reset_r2:

  eq r2 0 r4 ; Has no letter before
  jf r4 next_letter

  sub r3 32 r3 ; Make uppercase
  mov 1 r2     ; Store has letter before

  next_letter:
    mov r3 output
    jmp loop  

