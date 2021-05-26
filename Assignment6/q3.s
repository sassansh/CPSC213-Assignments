.pos 0x1000
# calculating average
average:
      ld    $n, r0      # r0 = address of n
      ld    (r0), r0    # r0 = n'
      ld    $s, r1      # r1 = address of s
      ld    (r1), r1    # r1 = s'
      ld    $24, r2     # r2 = 24 (size of student struct)

A1:   beq   r0, sort    # if n' == 0 goto sort
      ld    4(r1), r3   # r3 = s'->grade[0]
      ld    8(r1), r4   # r4 = s'->grade[1]
      add   r4, r3      # r3 = s'->grade[0] + s-'grade[1]
      ld    12(r1), r4  # r4 = s'->grade[2]
      add   r4, r3      # r3 = s'->grade[0] + s-'grade[1] + s'->grade[2]
      ld    16(r1), r4  # r4 = s'->grade[3]
      add   r4, r3      # r3 = GRADES_SUM = s'->grade[0] + s-'grade[1] + s'->grade[2] + s'->grade[3]
      shr   $2, r3      # r3 = GRADES_SUM / 4
      st    r3, 20(r1)  # s'->average = GRADES_SUM / 4
      add   r2, r1      # s' ++
      dec   r0          # n'--
      br    A1          # goto A1


# sorting using Bubble Sort
sort:
      ld    $n, r0      # r0 = address of n
      ld    (r0), r0    # r0 = n'
      ld    $s, r7      # r7 = address of s
      ld    (r7), r7    # r7 = s

# outer loop
      dec   r0          # n'--
S0:   beq   r0, S8      # if n' == 0 goto S8
      ld    $1, r1      # r1 = j' = 1

# inner loop
S1:   mov   r0, r3      # r3 = n'
      not   r3
      inc   r3          # r3 = -n'
      add   r1, r3      # r3 = j' - n'
      bgt   r3, S7      # if j' == 'n goto S7

# comparing
      mov   r1, r2      # r2 = j'
      mov   r1, r3      # r3 = j'
      shl   $4, r2      # r2 = j' * 16
      shl   $3, r3      # r3 = j' * 8
      add   r3, r2      # r2 = j' * 24
      add   r7, r2      # r2 = address of s[j']
      mov   r2, r3      # r3 = address of s[j']
      ld    $24, r4     # r3 = 24
      not   r4
      inc   r4          # r3 = -24
      add   r4, r2      # r2 = address of s[j'-1]]
      ld    20(r2), r4  # r4 = s[j'-1].average
      ld    20(r3), r5  # r5 = s[j'].average
      not   r4
      inc   r4          # r5 = -s[j'-1].average
      add   r5, r4      # r4 = s[j'].average - s[j'-1].average
      bgt   r4, S3      # if s[j'-1].average < s[j'].average goto S3
      beq   r4, S3      # if s[j'-1].average == s[j'].average goto S3

# swaping
      ld    $6, r4      # r4 = k' = 6 = 24 (size of student struct) / 4 
S2:   beq   r4, S3      # if k' == 0 goto S3
      ld    (r2), r5    # r5  = *a'
      ld    (r3), r6    # r6  = *b'
      st    r6, (r2)    # *a' = *b'
      st    r5, (r3)    # *b' = *a'
      inca  r2          # a'++
      inca  r3          # b'++
      dec   r4          # k'--
      br    S2          # goto S2

# restarting inner loop
S3:   inc   r1          # j'++
      br    S1          # goto S1

# restarting outer loop
S7:   dec   r0          # n'--
      br    S0          # goto S0
# end of sorting (Bubble Sort)

# figuring out median student ID
S8: ld    $n, r0      # r0 = address of n
    ld    (r0), r0    # r0 = n
    shr   $1, r0      # r0 = n/2 (/2 for median, middle of list)
    mov   r0, r1      # r1 = n/2
    shl   $3, r0      # r0 = (n/2) * 8
    shl   $4, r1      # r1 = (n/2) * 16
    add   r1, r0      # r0 = (n/2) * 24 = ((n/2) * 8) + ((n/2) * 16)
    ld    $s, r1      # r1 = address of s
    ld    (r1), r1    # r1 = s
    add   r1, r0      # r0 = address of s[n/2]
    ld    (r0), r0    # r0 = s[n/2].sid
    ld    $m, r1      # r1 = address of m
    st    r0, (r1)    # m  = s[n/2].sid
    halt

.pos 0x2000
n:    .long 9     # nine students for testing
m:    .long 0     # median student id
s:    .long base  # address of array

base:
.long 1          # student ID
.long 51         # grade 0
.long 89         # grade 1
.long 44         # grade 2
.long 36         # grade 3
.long 0          # computed average

.long 2          # student ID
.long 71         # grade 0
.long 88         # grade 1
.long 71         # grade 2
.long 54         # grade 3
.long 0          # computed average

.long 3          # student ID
.long 94         # grade 0
.long 6          # grade 1
.long 60         # grade 2
.long 86         # grade 3
.long 0          # computed average

.long 4          # student ID
.long 39         # grade 0
.long 61         # grade 1
.long 45         # grade 2
.long 81         # grade 3
.long 0          # computed average

.long 5          # student ID
.long 47         # grade 0
.long 2          # grade 1
.long 12         # grade 2
.long 79         # grade 3
.long 0          # computed average

.long 6          # student ID
.long 84         # grade 0
.long 78         # grade 1
.long 75         # grade 2
.long 89         # grade 3
.long 0          # computed average

.long 7          # student ID
.long 22         # grade 0
.long 46         # grade 1
.long 73         # grade 2
.long 6         # grade 3
.long 0          # computed average

.long 8          # student ID
.long 94         # grade 0
.long 34         # grade 1
.long 64         # grade 2
.long 19         # grade 3
.long 0          # computed average

.long 9          # student ID
.long 84         # grade 0
.long 44         # grade 1
.long 33         # grade 2
.long 22         # grade 3
.long 0          # computed average

