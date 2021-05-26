.pos 0x1000
code:

    # v0 = s.x [i];
    ld $i, r0           # r0 = address of i
    ld (r0), r0         # r0 = i
    ld $s, r1           # r1 = address of s
    ld (r1, r0, 4), r4  # r4 = s.x[i]
    ld $v0, r2          # r2 = address of v0
    st r4, (r2)         # v0 = s.x[i]

    # v1 = s.y [i];
    ld 8(r1), r3        # r3 = s.y
    ld (r3, r0, 4), r4  # r4 = s.y[i]
    ld $v1, r2          # r2 = address of v1
    st r4, (r2)         # v1 = s.y[i]

    # v2 = s.z->x [i];
    ld 12(r1), r3       # r3 = s.z
    ld (r3, r0, 4), r4  # r4 = s.z->x[i]
    ld $v2, r2          # r2 = address of v2
    st r4, (r2)         # v2 = s.z->x[i]

    # v3 = s.z->z->y[i];
    ld 12(r1), r3       # r3 = s.z
    ld 12(r3), r3       # r3 = s.z->z
    ld 8(r3),  r3       # r3 = s.z->z->y
    ld (r3, r0, 4), r4  # r4 = s.z->z->y[i]
    ld $v3, r2          # r2 = address of v3
    st r4, (r2)         # v3 = s.z->z->y[i]

    # stop
    halt    # halt

.pos 0x2000
static:

i:      .long 0         # i
v0:     .long 0         # v0
v1:     .long 0         # v1
v2:     .long 0         # v2
v3:     .long 0         # v3
s:      .long 0         # s.x[0]
        .long 0         # s.x[1]
        .long s_y       # s.y
        .long s_z       # s.z


.pos 0x3000
heap:
s_y:     .long 0        # s.y[0]
         .long 0        # s.y[1]
s_z:     .long 0        # s.z->x[0]
         .long 0        # s.z->x[1]
         .long s_z_y    # s.z->y
         .long s_z_z    # s.z->z
s_z_y:   .long 0        # s.z->y[0]
         .long 0        # s.z->y[1]
s_z_z:   .long 0        # s.z->z->x[0]
         .long 0        # s.z->z->x[1]
         .long s_z_z_y  # s.z->z->y
         .long 0        # s.z->z->z
s_z_z_y: .long 0        # s.z->z->y[0]
         .long 0        # s.z->z->y[1]

