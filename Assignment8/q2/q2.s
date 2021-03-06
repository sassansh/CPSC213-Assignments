.pos 0x0
                 ld   $0x1028, r5         # r5 = &stack (bottom)
                 ld   $0xfffffff4, r0     # r0 = -12
                 add  r0, r5              # Stack Initialization (allocate)
                 ld   $0x200, r0          # r0 = &a
                 ld   0x0(r0), r0         # r0 = a
                 st   r0, 0x0(r5)         # push a to stack
                 ld   $0x204, r0          # r0 = &b
                 ld   0x0(r0), r0         # r0 = b
                 st   r0, 0x4(r5)         # push b on stack
                 ld   $0x208, r0          # r0 = &c
                 ld   0x0(r0), r0         # r0 = c
                 st   r0, 0x8(r5)         # push c on stack
                 gpc  $6, r6              # r6 = ra
                 j    0x300               # call foo(a,b,c)
                 ld   $0x20c, r1          # r1 = &c
                 st   r0, 0x0(r1)         # c = foo(a,b,c) stored in r0
                 halt                     
.pos 0x200
                 .long 0x00000000         # a
                 .long 0x00000000         # b
                 .long 0x00000000         # c
                 .long 0x00000000         # d
.pos 0x300
                 ld   0x0(r5), r0         # r0 = f
                 ld   0x4(r5), r1         # r1 = i
                 ld   0x8(r5), r2         # r2 = r
                 ld   $0xfffffff6, r3     # r3 = -10
                 add  r3, r0              # r0 = f - 10
                 mov  r0, r3              # r3 = f - 10
                 not  r3                  
                 inc  r3                  # r3 = 10 - f
                 bgt  r3, default         # if (f < 10) go to L6
                 mov  r0, r3              # r3 = f - 10
                 ld   $0xfffffff8, r4     # r4 = -8
                 add  r4, r3              # r3 = f - 10 - 8
                 bgt  r3, default         # if (f > 18) go to L5
                 ld   $0x400, r3          # r3 = &jumptable
                 j    *(r3, r0, 4)        # go to jumptable[f-10]
.pos 0x330
case10:          add  r1, r2              # r = r + 1
                 br   L7                  # break
case12:          not  r2                  
                 inc  r2                  # r2 = -j
                 add  r1, r2              # r = i - r
                 br   L7                  # break
case14:          not  r2                  
                 inc  r2                  # r2 = -j
                 add  r1, r2              # r2 = i - r
                 bgt  r2, L0              # if (i > r) go to L0
                 ld   $0x0, r2            # if (i <= r) then r = 0
                 br   L1                  
L0:              ld   $0x1, r2            # if (i > r) then r = 1
L1:              br   L7                  # break
case16:          not  r1                  
                 inc  r1                  # r1 = -i
                 add  r2, r1              # r1 = r - i
                 bgt  r1, L2              # if (j > i) go to L2
                 ld   $0x0, r2            # if (r <= i) then r = 0
                 br   L3                  
L2:              ld   $0x1, r2            # if (j > 1) then r = 1
L3:              br   L7                  # break
case18:          not  r2                  
                 inc  r2                  # r2 = -j
                 add  r1, r2              # r2 = i - r
                 beq  r2, L4              # if (i == r) go to L4
                 ld   $0x0, r2            # if (i != r) then r = 0
                 br   L5                  
L4:              ld   $0x1, r2            # r = 1 if i == r
L5:              br   L7                  # break
default:         ld   $0x0, r2            # r = 0
                 br   L7                  # break
L7:              mov  r2, r0              # return value = r
                 j    0x0(r6)             
.pos 0x400                                # jumptable
                 .long 0x00000330         # case10
                 .long 0x00000384         # default
                 .long 0x00000334         # case12
                 .long 0x00000384         # default
                 .long 0x0000033c         # case14
                 .long 0x00000384         # default
                 .long 0x00000354         # case16
                 .long 0x00000384         # default
                 .long 0x0000036c         # case18
.pos 0x1000
                 .long 0x00000000         # top of stack
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         # bottom of stack
