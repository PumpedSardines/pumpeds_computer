; Mov robot to the position
mov 0 output
mov 1 output
mov 1 output
mov 2 output
mov 1 output

loop:
  mov input r0 ; Store what the robot sees in r0
  eq r0 0 r1   ; Check if the robot sees nothing
  jf r1 shoot     ; If it doesn't see nothing, shoot

  mov 3 output ; Tell the robot to do nothing
  jmp loop

  shoot:
    mov 5 output ; Tell the robot to shoot
    jmp loop

