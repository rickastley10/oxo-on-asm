.data
space: .string " "
x: .string "x"
o: .string "o"
pi: .string "|"
si: .string "-"



newline: .string "\n"


.text
.globl main

main:
li s0, 0 # x = 0 (current Fibonacci)
li s1, 1          # y = 1 (next Fibonacci)
li s2, 20
la s4, space      # space string for printing

la s10, x 
la s11, o
la t3, pi 
la t4, si
la t5, newline

li s5, 1
li s6, 1

# Changed cell registers to avoid conflicts with s10(x26), s11(x27), t3(x28), t4(x29)
li x5, 0    # cell 1 (was x21)
li x6, 0    # cell 2 (was x22)
li x7, 0    # cell 3 (was x23)
li x8, 0    # cell 4 (was x24)
li x9, 0    # cell 5 (was x25)
li x18, 0   # cell 6 (was x26)
li x19, 0   # cell 7 (was x27)
li x20, 0   # cell 8 (was x28)
li x21, 0   # cell 9 (was x29)

li t0, 0
li t1, 1
li t2, 2

loop:
 # first line
mv a0, t5
li a7, 4          # print_string syscall    \n
ecall

j .c1
                  # print_string syscall    _   1
.pass1:

mv a0, t3
li a7, 4          # print_string syscall    |
ecall

j .c2
                  # print_string syscall    _   2
.pass2:

mv a0, t3
li a7, 4          # print_string syscall    |
ecall

j .c3
                  # print_string syscall    _   3
.pass3:




mv a0, t5
li a7, 4          # print_string syscall    \n
ecall



 # second line

mv a0, t4
li a7, 4          # print_string syscall    -
ecall
mv a0, t4
li a7, 4          # print_string syscall    -
ecall
mv a0, t4
li a7, 4          # print_string syscall    -
ecall
mv a0, t4
li a7, 4          # print_string syscall    -
ecall
mv a0, t4
li a7, 4          # print_string syscall    -
ecall


 # third line
mv a0, t5
li a7, 4          # print_string syscall    \n
ecall

j .c4
                  # print_string syscall    _   4
.pass4:

mv a0, t3
li a7, 4          # print_string syscall    |
ecall

j .c5
                  # print_string syscall    _   5
.pass5:

mv a0, t3
li a7, 4          # print_string syscall    |
ecall

j .c6
                  # print_string syscall    _   6
.pass6:




mv a0, t5
li a7, 4          # print_string syscall    \n
ecall



 # fourth line

mv a0, t4
li a7, 4          # print_string syscall    -
ecall
mv a0, t4
li a7, 4          # print_string syscall    -
ecall
mv a0, t4
li a7, 4          # print_string syscall    -
ecall
mv a0, t4
li a7, 4          # print_string syscall    -
ecall
mv a0, t4
li a7, 4          # print_string syscall    -
ecall




 # firth line
mv a0, t5
li a7, 4          # print_string syscall    \n
ecall

j .c7
                  # print_string syscall    _   7
.pass7:

mv a0, t3
li a7, 4          # print_string syscall    |
ecall

j .c8
                  # print_string syscall    _   8
.pass8:

mv a0, t3
li a7, 4          # print_string syscall    |
ecall

j .c9
                  # print_string syscall    _   9
.pass9:







j loop
.nquit:
    # Exit
    li a7, 10
    ecall




.c1:
beq x5, t0, .placespace1    # Changed from x21
beq x5, t1, .placex1        # Changed from x21
beq x5, t2, .placeo1        # Changed from x21
j .pass1

.c2:
beq x6, t0, .placespace2    # Changed from x22
beq x6, t1, .placex2        # Changed from x22
beq x6, t2, .placeo2        # Changed from x22
j .pass2

.c3:
beq x7, t0, .placespace3    # Changed from x23
beq x7, t1, .placex3        # Changed from x23
beq x7, t2, .placeo3        # Changed from x23
j .pass3

.c4:
beq x8, t0, .placespace4    # Changed from x24
beq x8, t1, .placex4        # Changed from x24
beq x8, t2, .placeo4        # Changed from x24
j .pass4

.c5:
beq x9, t0, .placespace5    # Changed from x25
beq x9, t1, .placex5        # Changed from x25
beq x9, t2, .placeo5        # Changed from x25
j .pass5

.c6:
beq x18, t0, .placespace6   # Changed from x26
beq x18, t1, .placex6       # Changed from x26
beq x18, t2, .placeo6       # Changed from x26
j .pass6

.c7:
beq x19, t0, .placespace7   # Changed from x27
beq x19, t1, .placex7       # Changed from x27
beq x19, t2, .placeo7       # Changed from x27
j .pass7

.c8:
beq x20, t0, .placespace8   # Changed from x28
beq x20, t1, .placex8       # Changed from x28
beq x20, t2, .placeo8       # Changed from x28
j .pass8

.c9:
beq x21, t0, .placespace9   # Changed from x29
beq x21, t1, .placex9       # Changed from x29
beq x21, t2, .placeo9       # Changed from x29
j .pass9


.placeo1:

mv a0, s11
li a7, 4          # print_string syscall    O
ecall
j .pass1


.placex1:


mv a0, s10
li a7, 4          # print_string syscall    X
ecall
j .pass1


.placespace1:

mv a0, s4
li a7, 4          # print_string syscall    _
ecall
j .pass1





.placeo2:

mv a0, s11
li a7, 4          # print_string syscall    O
ecall
j .pass2


.placex2:


mv a0, s10
li a7, 4          # print_string syscall    X
ecall
j .pass2


.placespace2:

mv a0, s4
li a7, 4          # print_string syscall    _
ecall
j .pass2




.placeo3:

mv a0, s11
li a7, 4          # print_string syscall    O
ecall
j .pass3


.placex3:


mv a0, s10
li a7, 4          # print_string syscall    X
ecall
j .pass3


.placespace3:

mv a0, s4
li a7, 4          # print_string syscall    _
ecall
j .pass3






.placeo4:

mv a0, s11
li a7, 4          # print_string syscall    O
ecall
j .pass4


.placex4:


mv a0, s10
li a7, 4          # print_string syscall    X
ecall
j .pass4


.placespace4:

mv a0, s4
li a7, 4          # print_string syscall    _
ecall
j .pass4






.placeo5:

mv a0, s11
li a7, 4          # print_string syscall    O
ecall
j .pass5


.placex5:


mv a0, s10
li a7, 4          # print_string syscall    X
ecall
j .pass5


.placespace5:

mv a0, s4
li a7, 4          # print_string syscall    _
ecall
j .pass5






.placeo6:

mv a0, s11
li a7, 4          # print_string syscall    O
ecall
j .pass6


.placex6:


mv a0, s10
li a7, 4          # print_string syscall    X
ecall
j .pass6


.placespace6:

mv a0, s4
li a7, 4          # print_string syscall    _
ecall
j .pass6






.placeo7:

mv a0, s11
li a7, 4          # print_string syscall    O
ecall
j .pass7


.placex7:


mv a0, s10
li a7, 4          # print_string syscall    X
ecall
j .pass7


.placespace7:

mv a0, s4
li a7, 4          # print_string syscall    _
ecall
j .pass7







.placeo8:

mv a0, s11
li a7, 4          # print_string syscall    O
ecall
j .pass8



.placex8:


mv a0, s10
li a7, 4          # print_string syscall    X
ecall
j .pass8


.placespace8:

mv a0, s4
li a7, 4          # print_string syscall    _
ecall
j .pass8








.placeo9:

mv a0, s11
li a7, 4          # print_string syscall    O
ecall
j .pass9


.placex9:


mv a0, s10
li a7, 4          # print_string syscall    X
ecall
j .pass9


.placespace9:

mv a0, s4
li a7, 4          # print_string syscall    _
ecall
j .pass9









