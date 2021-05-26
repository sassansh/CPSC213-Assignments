.pos 0x0
                 ld   $sb, r5              # initialize stack pointer
                 inca r5                   # deallocate callee portion of stack frame
                 gpc  $6, r6               # store return address
                 j    set                  # call set
                 halt                     
.pos 0x100
l:              .long 0x00001000           # int *l = list
.pos 0x200
add:             ld   (r5), r0             # r0 = x
                 ld   4(r5), r1            # r1 = y
                 ld   $l, r2               # r2 = address of l
                 ld   (r2), r2             # r2 = l
                 ld   (r2, r1, 4), r3      # r3 = l[y]
                 add  r3, r0               # r0 = x + l[y]
                 st   r0, (r2, r1, 4)      # l[y] = x + l[y]
                 j    (r6)                 # return
.pos 0x300
set:             ld   $-12, r0             # r0 = -12
                 add  r0, r5               # allocate frame on stack
                 st   r6, 8(r5)            # store frame address
                 ld   $1, r0               # r0 = 1
                 st   r0, (r5)             # x (on stack) = 1
                 ld   $2, r0               # r0 = 2
                 st   r0, 4(r5)            # y (on stack) = 2
                 ld   $-8, r0              # r0 = -8
                 add  r0, r5               # decrease stack pointer by 8
                 ld   $3, r0               # r0 = 3
                 st   r0, (r5)             # push 3 to stack
                 ld   $4, r0               # r0 = 4
                 st   r0, 4(r5)            # push 4 to stack
                 gpc  $6, r6               # set return address
                 j    add                  # call add(3,4)
                 ld   $8, r0               # r0 = 8
                 add  r0, r5               # deallocate pushed arguments
                 ld   (r5), r1             # r1 = x
                 ld   4(r5), r2            # r2 = y
                 ld   $-8, r0              # r0 = -8
                 add  r0, r5               # decrease stack pointer by 8
                 st   r1, (r5)             # push x to stack
                 st   r2, 4(r5)            # push y to stack
                 gpc  $6, r6               # set return address
                 j    add                  # call add(x,y)
                 ld   $8, r0               # r0 = 8
                 add  r0, r5               # deallocate pushed arguments
                 ld   8(r5), r6            # load return address
                 ld   $12, r0              # r0 = 12
                 add  r0, r5               # deallocate frame on stack
                 j    (r6)                 # return
.pos 0x1000
list:            .long 0                # list[0]
                 .long 0                # list[1]
                 .long 0                # list[2]
                 .long 0                # list[3]
                 .long 0                # list[4]
                 .long 0                # list[5]
                 .long 0                # list[6]
                 .long 0                # list[7]
                 .long 0                # list[8]
                 .long 0                # list[9]
.pos 0x8000
# These are here so you can see (some of) the stack contents.
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
sb: .long 0
