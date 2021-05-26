.pos 0x100

    ld $a, r0             # r0 = address of a
    ld  $3, r1            # r1 = 3
    ld (r0, r1, 4), r1    # r1 = a[3]
    ld (r0, r1, 4), r1    # r1 = a[a[3]]
    ld  $i, r2            # r2 = address of i
    st  r1, (r2)          #  i = a[a[3]]
    ld  $j, r1            # r1 = address of j
    ld  $4, r2            # r2 = 4
    st  r2, (r1)          # *p = 4

    # p  = &a[a[2]]
    ld  $2, r2            # r2 = 2
    ld  (r0, r2, 4), r2   # r2 = a[2]
    shl $2, r2            # r2 = a[2] * 4 (offset calculation)
    add r0, r2            # r2 = address of a + ( a[2] * 4 ) = address of a[a[2]]
    ld  $p, r3            # r3 = address of p
    st  r2, (r3)          #  p = address of a[a[2]]

    # *p = *p + a[4];
    ld  (r2), r3          # r3 = *p
    ld  $4, r4            # r4 = 4
    ld  (r0, r4, 4), r4   # r4 = a[4]
    add r4, r3            # r3 = *p + a[4]
    st  r3, (r2)          # *p = *p + a[4]

    
    halt

.pos 0x200
# Data area

i:  .long 0               # i
j:  .long 0               # j
p:  .long 0               # p
a:  .long 1               # a[0]
    .long 2               # a[1]
    .long 3               # a[2]
    .long 4               # a[3]
    .long 5               # a[4]
    .long 6               # a[5]
    .long 7               # a[6]
    .long 8               # a[7]
    .long 9               # a[8]
    .long 10              # a[9]
