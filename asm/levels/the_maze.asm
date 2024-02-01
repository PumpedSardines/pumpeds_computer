mov 0 output

loop:
  mov 1 output ; move forward

  eq input 3 r1 ; Check if the robot is on the goal
  jt r1 end

  mov 0 output ; Check if there is a wall to the left of the robot
  eq input 1 r1
  jf r1 no_wall

  mov 2 output ; There was a wall and we turn back

  eq input 1 r1 ; Check if there is a wall in front of the robot
  jf r1 no_wall

  mov 2 output ; There was a wall and we turn again

  jmp loop ; Repeat

  no_wall:
    jmp loop


end:
  mov 4 output
