.pos 0x100

    ld    $3, r0             # r0 = 3 (temp spot to hold value of a)
    ld    $a, r1             # r1 = address of a
    st    r0, (r1)           # a = 3
    ld    $p, r2             # r2 = address of p
    st    r1, (r2)           # p = address of a

    # *p = *p - 1
    dec   r0                 # r0 = *p - 1 = 3 - 1 = 2
    st    r0, (r1)           # a = 2 (storing value of a from register to memory)

    # p = &b[0]
    ld    $b, r1             # r0 = address of b[0]
    st    r1, (r2)           # p = address of b[0]
    mov   r1, r2             # r2 = address of b[0]

    inca  r2                 # r2 = p++

    # p[a] = b[a]
    ld    (r1, r0, 4), r3    # r3 = b[a]
    st    r3, (r2, r0, 4)    # p[a] = b[a]

    # *(p+3) = b[0]
    ld    (r1), r1           # r1 = b[0]
    ld    $3, r0             # r0 = 3
    st    r1, (r2, r0, 4)    # *(p+3) = b[0]

    # store new vlaue of p from register to memory
    ld    $p, r1             # r1 = &p
    st    r2, (r1)           # p = r2


    halt

.pos 0x200
# Data area

a:    .long 0                # a
p:    .long 0                # p
b:    .long 0                # b[0]
      .long 0                # b[1]
      .long 0                # b[2]
      .long 0                # b[3]
      .long 0                # b[4]
