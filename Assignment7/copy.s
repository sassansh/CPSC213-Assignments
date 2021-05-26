.pos 0x100
start:           ld   $stackBtm, r5       # p = address of last word of stack
                 inca r5                  # sp = address of word after stack
                 gpc  $6, r6              # ra = pc + 6
                 j    copy                # call copy()
                 halt

.pos 0x200
copy:            deca r5                  # allocate calle part of copy's frame
                 st   r6, (r5)            # save ra on stack

                 ld   $0x0, r0            # r0 = temp_i = 0
                 ld   $src, r1            # r1 = address of src[0]
                 deca r5                  # allocate space for dst[0]
                 deca r5                  # allocate space for dst[1]

loop:            ld   (r1, r0, 4), r2     # r3 = src[temp_i]
                 beq  r2, end_loop        # if src[temp_i]=0 go to end_loop
                 st   r2, (r5, r0, 4)     # dst[temp_i]=src[temp_i]
                 inc  r0                  # temp_i++
                 br   loop                # restart loop

end_loop:        ld   $0x0, r2            # r2 = 0
                 st   r2, (r1, r0, 4)     # dst[temp_i] = 0
                 inca r5                  # deallocate stack
                 inca r5                  # deallocate stack
                 ld   (r5), r6            # load ra from stack
                 inca r5                  # remove callee part of stack frame
                 j    (r6)                # return
                 ld   $-1, r0
                 ld   $-1, r1



.pos 0x2000
src:             .long 1                  # src[0]
                 .long 1                  # src[1]
                 .long 0x200c
                 .long 0xff000000
                 .long 0xffffffff
                 .long 0xff000100
                 .long 0xffffffff
                 .long 0xff000200
                 .long 0xffffffff
                 .long 0xff000300
                 .long 0xffffffff
                 .long 0xff000400
                 .long 0xffffffff     
                 .long 0xff000500
                 .long 0xffffffff
                 .long 0xff000600
                 .long 0xffffffff     
                 .long 0xff000600
                 .long 0xffffffff  
                 .long 0xf000f000                                                        
.pos 0x1000
stackTop:        .long 0x00000000
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
stackBtm:        .long 0x00000000
