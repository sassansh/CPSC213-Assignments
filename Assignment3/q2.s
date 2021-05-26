.pos 0x100

    ld    $0, r0            # r0 = 0 (temp spot for value of tmp)
    ld    $0, r1            # r1 = 0 (temp spot for value of tos)
    ld    $tmp, r6          # r6 = address of tmp
    ld    $tos, r7          # r7 = address of tos
    st    r0, (r6)          # tmp = 0
    st    r1, (r7)          # tos = 0

    # s[tos] = a[0];
    ld    $a, r2            # r2 = address of a
    ld    $s, r3            # r3 = address of s
    ld    (r2), r4          # r4 = a[0]
    st    r4, (r3, r1, 4)   # s[tos] = a[0]

    inc   r1                # tos++

    # s[tos] = a[1];
    ld    4(r2), r4         # r4 = a[1]
    st    r4, (r3, r1, 4)   # s[tos] = a[1]

    inc   r1                # tos++

    # s[tos] = a[2];
    ld    8(r2), r4         # r4 = a[2]
    st    r4, (r3, r1, 4)   # s[tos] = a[2]

    inc   r1                # tos++
    dec   r1                # tos--

    # tmp = s[tos];
    ld    (r3, r1, 4), r4   # r4 = s[tos]
    mov   r4, r0            # tmp = s[tos]

    dec   r1                # tos--

    # tmp = tmp + s[tos];
    ld    (r3, r1, 4), r4   # r4 = s[tos]
    add   r4, r0            # tmp = tmp + s[tos]

    dec   r1                # tos--

    # tmp = tmp + s[tos];
    ld    (r3, r1, 4), r4   # r4 = s[tos]
    add   r4, r0            # tmp = tmp + s[tos]
    st    r0, (r6)          # tmp = tmp (storing value of tmp from register into memory)
    st    r1, (r7)          # tos = tos (storing value of tos from register into memory)


    halt

.pos 0x200
# Data area

a:    .long 0               # a[0]
      .long 0               # a[1]
      .long 0               # a[2]
s:    .long 0               # s[0]
      .long 0               # s[1]
      .long 0               # s[2]
      .long 0               # s[3]
      .long 0               # s[4]
tos:  .long 0               # tos
tmp:  .long 0               # tmp
