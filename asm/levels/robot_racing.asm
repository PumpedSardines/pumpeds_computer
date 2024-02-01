; r0 keeps track of the direction of the robot currently
main:
  mov 3 r0 ; Setting initial direction to 3 (up)

  call hilbert_big_left
  call go_forwards
  call look_right
  call hilbert_big_right
  call go_forwards
  call hilbert_big_right
  call look_right
  call go_forwards
  call hilbert_big_left

  halt ok

hilbert_big_left:
  call hilbert_right
  call look_left
  call go_forwards
  call hilbert_left
  call look_right
  call go_forwards
  call look_right
  call hilbert_left
  call go_forwards
  call look_left
  call hilbert_right
  ret

hilbert_big_right:
  call hilbert_left
  call look_right
  call go_forwards
  call hilbert_right
  call look_left
  call go_forwards
  call look_left
  call hilbert_right
  call go_forwards
  call look_right
  call hilbert_left
  ret

hilbert_left:
  call go_forwards
  call look_left
  call go_forwards
  call look_left
  call go_forwards

  ret

hilbert_right:
  call go_forwards
  call look_right
  call go_forwards
  call look_right
  call go_forwards

  ret

; Custom functions for moving left right forwards and backwards
; r0 keeps track of the direction
look_left:
  sub r0 1 r0
  and 0x00000003 r0 r0
  ret

look_right:
  add r0 1 r0
  and 0x00000003 r0 r0
  ret

look_backwards:
  sub r0 2 r0
  and 0x00000003 r0 r0
  ret

go_forwards:
  mov r0 output
  ret
