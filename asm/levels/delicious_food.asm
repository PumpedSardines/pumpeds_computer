; Loads the input into ram
; The 15 first input values are stored in ram addresses 0 to 14
mov 0 r1
load_data_loop:
  mov input r2
  sram r1 r2
  add 1 r1 r1
  eq r1 15 r3
  jf r3 load_data_loop

; The idea of the sort:
; Loop through all the elements and find the smallest one and output it
; Then loop through again and set the smallest one to MAX_INT
; Repeat until all elements are sorted

main:

  mov 0 r1 ; Current index in ram
  mov -1 r0 ; Current smallest

  find_smallest_loop:
    lram r1 r2  ; Load the current element into r2  
    u_lt r2 r0 r3 ; Compare the current element with the smallest
    jf r3 skip_update_smallest  ; If the current element is not smaller, skip
    mov r2 r0   ; Set the current element as the smallest
    skip_update_smallest:
    add 1 r1 r1 ; Increment the current index
    eq r1 15 r3 ; Check if we have reached the end
    jf r3 find_smallest_loop  ; If not, loop

  mov 0 r1      ; Current index in ram
  mov r0 output ; Output the smallest element
  mov -1 r8      ; Reset number

  set_smallest_to_max_loop:
    lram r1 r2  ; Load the current element into r2  
    eq r2 r0 r3 ; Compare the current element with the smallest
    jf r3 skip_set_smallest_to_max  
    sram r1 r8  ; Set the current element to MAX_INT 
    jmp main
    skip_set_smallest_to_max:
    add 1 r1 r1 ; Increment the current index
    jmp set_smallest_to_max_loop
