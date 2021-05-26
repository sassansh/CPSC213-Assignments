.pos 0x100
start:
    ld $sb, r5              # initialize the stack pointer
    inca    r5              # deallocate callee portion of stack frame
    gpc $6, r6              # set return address
    j main                  # call main
    halt                    

f:                          # int f(int i)
    deca r5                 # allocate stack frame
    ld $0, r0               # r0 = j' = 0
    ld 4(r5), r1            # r1 = i' = i
    ld $0x80000000, r2      # r2 = 0x80000000
f_loop:
    beq r1, f_end           # if i' == 0 goto f_end
    mov r1, r3              # r3 = i'
    and r2, r3              # r3 = i' & 0x80000000
    beq r3, f_if1           # if !(i' & 0x80000000) goto f_if1
    inc r0                  # if i' & 0x80000000, j'++
f_if1:
    shl $1, r1              # i' = i' << 1
    br f_loop               # goto f_loop
f_end:
    inca r5                 # deallocate stack frame
    j (r6)                  # return

main:
    deca r5                 # allocate stack frame
    deca r5                 # allocate stack frame
    st r6, 4(r5)            # store return address
    ld $8, r4               # r4 = i' = 8
main_loop:
    beq r4, main_end        # if i' == 0 goto main_end
    dec r4                  # i'--
    ld $x, r0               # r0 =  address ofx
    ld (r0,r4,4), r0        # r0 = x[i']
    deca r5                 # allocate stack from (one integer)
    st r0, (r5)             # push x[i] to stack
    gpc $6, r6              # set return address
    j f                     # call f(x[i'])
    inca r5                 # deallocate stack frame
    ld $y, r1               # r1 = address of y
    st r0, (r1,r4,4)        # y[i'] = f(x[i'])
    br main_loop            # goto main_loop
main_end:
    ld 4(r5), r6            # load return address
    inca r5                 # deallocate stack frame
    inca r5                 # deallocate stack frame
    j (r6)                  # return

.pos 0x2000
x:                          # int x[8] = {1, 2, 3, -1, -2, 0, 184, 340057058}
    .long 1                 # x[0]
    .long 2                 # x[1]
    .long 3                 # x[2]
    .long -1                # x[3]
    .long -2                # x[4]
    .long 0                 # x[5]
    .long 184               # x[6]
    .long 340057058         # x[7]

y:                          # int y[8];
    .long 0                 # y[0]
    .long 0                 # y[1]
    .long 0                 # y[2]
    .long 0                 # y[3]
    .long 0                 # y[4]
    .long 0                 # y[5]
    .long 0                 # y[6]
    .long 0                 # y[7]

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

