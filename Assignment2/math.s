.pos 0x100
                 ld   $b, r0              # r0 = address of b
                 ld   (r0), r0            # r0 = b
                 mov  r0, r1              # r1 = b
                 inc  r1                  # r1 = (b + 1)
                 inca r1                  # r1 = ((b + 1) + 4)
                 shr  $1, r1              # r1 = (((b + 1) + 4) / 2)
                 and  r0, r1              # r1 = ((((b + 1) + 4) / 2) & b)
                 shl  $2, r1              # r1 = ((((b + 1) + 4) / 2) & b) << 2
                 ld   $a, r0              # r0 = address of a
                 st   r1, (r0)            # a = ((((b + 1) + 4) / 2) & b) << 2
                 halt
.pos 0x2000
a:               .long 2                  # a
b:               .long 5                  # b