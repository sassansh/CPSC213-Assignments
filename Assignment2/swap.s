.pos 0x100
                 ld   $array, r0          # r0 = address of array
                 ld   (r0), r1            # r1 = array[0]
                 ld   4(r0), r2           # r2 = array[1]
                 st   r2, (r0)            # array[0] = array[1]
                 st   r1, 4(r0)           # array[1] = array[0]
                 halt
.pos 0x2000
array:           .long 2                  # array[0]
                 .long 5                  # array[1]