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
addi sp, sp, -400

li s0, 0 # x = 0 (current Fibonacci)
li s1, 1          # y = 1 (next Fibonacci)
li s2, 20
la s4, space      # space string for printing

la s10, x 
la s11, o
la t3, pi 
la t4, si
la t5, newline

li t6, 0
lw t6, 0(sp)




li t6, 1
lw t6, 21(sp)       # permanent 1
li t6, 2
lw t6, 22(sp)       # permanent 2
li t6, 3
lw t6, 23(sp)       # permanent 3
li t6, 4
lw t6, 24(sp)       # permanent 4
li t6, 5
lw t6, 25(sp)       # permanent 5
li t6, 6
lw t6, 26(sp)       # permanent 6
li t6, 7
lw t6, 27(sp)       # permanent 7
li t6, 8
lw t6, 28(sp)       # permanent 8
li t6, 9
lw t6, 29(sp)       # permanent 9




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

# Changed constants to s registers to avoid conflict with x5, x6, x7
li s7, 0    # EMPTY constant
li s8, 1    # X constant
li s9, 2    # O constant

loop:
 # first line
mv a0, t5
li a7, 4          # print_string syscall    \n
ecall
mv a0, t5
li a7, 4          # print_string syscall    \n
ecall
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




li a7, 5          # ReadInt
ecall
sw a0, 0(sp)      # Store input to stack

# Load input into register
lw t6, 0(sp)

# Compare with constants (use multiples of 4!)
li t0, 1
beq t6, t0, .choice1

li t0, 2
beq t6, t0, .choice2

li t0, 3
beq t6, t0, .choice3

li t0, 4
beq t6, t0, .choice4

li t0, 5
beq t6, t0, .choice5

li t0, 6
beq t6, t0, .choice6

li t0, 7
beq t6, t0, .choice7

li t0, 8
beq t6, t0, .choice8

li t0, 9
beq t6, t0, .choice9






j loop  #           LOOP end













.choice1:
li a7, 5          # ReadInt (1 for X, 2 for O)
ecall
mv t6, a0         # Save input

li t0, 1
beq t6, t0, .set_cell1_x

li t0, 2
beq t6, t0, .set_cell1_o

j loop            # Invalid input, skip

.set_cell1_x:
li t6, 1
mv x5, t6         # Actually CHANGE cell 1 to X (1)
j loop

.set_cell1_o:
li t6, 2
mv x5, t6         # Actually CHANGE cell 1 to O (2)
j loop


.choice2:
li a7, 5
ecall
mv t6, a0

li t0, 1
beq t6, t0, .set_cell2_x

li t0, 2
beq t6, t0, .set_cell2_o

j loop

.set_cell2_x:
li t6, 1
mv x6, t6         # Change cell 2 to X
j loop

.set_cell2_o:
li t6, 2
mv x6, t6         # Change cell 2 to O
j loop


.choice3:
li a7, 5
ecall
mv t6, a0

li t0, 1
beq t6, t0, .set_cell3_x

li t0, 2
beq t6, t0, .set_cell3_o

j loop

.set_cell3_x:
li t6, 1
mv x7, t6
j loop

.set_cell3_o:
li t6, 2
mv x7, t6
j loop


.choice4:
li a7, 5
ecall
mv t6, a0

li t0, 1
beq t6, t0, .set_cell4_x

li t0, 2
beq t6, t0, .set_cell4_o

j loop

.set_cell4_x:
li t6, 1
mv x8, t6
j loop

.set_cell4_o:
li t6, 2
mv x8, t6
j loop


.choice5:
li a7, 5
ecall
mv t6, a0

li t0, 1
beq t6, t0, .set_cell5_x

li t0, 2
beq t6, t0, .set_cell5_o

j loop

.set_cell5_x:
li t6, 1
mv x9, t6
j loop

.set_cell5_o:
li t6, 2
mv x9, t6
j loop


.choice6:
li a7, 5
ecall
mv t6, a0

li t0, 1
beq t6, t0, .set_cell6_x

li t0, 2
beq t6, t0, .set_cell6_o

j loop

.set_cell6_x:
li t6, 1
mv x18, t6
j loop

.set_cell6_o:
li t6, 2
mv x18, t6
j loop


.choice7:
li a7, 5
ecall
mv t6, a0

li t0, 1
beq t6, t0, .set_cell7_x

li t0, 2
beq t6, t0, .set_cell7_o

j loop

.set_cell7_x:
li t6, 1
mv x19, t6
j loop

.set_cell7_o:
li t6, 2
mv x19, t6
j loop


.choice8:
li a7, 5
ecall
mv t6, a0

li t0, 1
beq t6, t0, .set_cell8_x

li t0, 2
beq t6, t0, .set_cell8_o

j loop

.set_cell8_x:
li t6, 1
mv x20, t6
j loop

.set_cell8_o:
li t6, 2
mv x20, t6
j loop


.choice9:
li a7, 5
ecall
mv t6, a0

li t0, 1
beq t6, t0, .set_cell9_x

li t0, 2
beq t6, t0, .set_cell9_o

j loop

.set_cell9_x:
li t6, 1
mv x21, t6
j loop

.set_cell9_o:
li t6, 2
mv x21, t6
j loop























.nquit:
    # Exit
    li a7, 10
    ecall




.c1:
beq x5, s7, .placespace1    # Changed t0 to s7
beq x5, s8, .placex1        # Changed t1 to s8
beq x5, s9, .placeo1        # Changed t2 to s9
j .pass1

.c2:
beq x6, s7, .placespace2    # Changed t0 to s7
beq x6, s8, .placex2        # Changed t1 to s8
beq x6, s9, .placeo2        # Changed t2 to s9
j .pass2

.c3:
beq x7, s7, .placespace3    # Changed t0 to s7
beq x7, s8, .placex3        # Changed t1 to s8
beq x7, s9, .placeo3        # Changed t2 to s9
j .pass3

.c4:
beq x8, s7, .placespace4    # Changed t0 to s7
beq x8, s8, .placex4        # Changed t1 to s8
beq x8, s9, .placeo4        # Changed t2 to s9
j .pass4

.c5:
beq x9, s7, .placespace5    # Changed t0 to s7
beq x9, s8, .placex5        # Changed t1 to s8
beq x9, s9, .placeo5        # Changed t2 to s9
j .pass5

.c6:
beq x18, s7, .placespace6   # Changed t0 to s7
beq x18, s8, .placex6       # Changed t1 to s8
beq x18, s9, .placeo6       # Changed t2 to s9
j .pass6

.c7:
beq x19, s7, .placespace7   # Changed t0 to s7
beq x19, s8, .placex7       # Changed t1 to s8
beq x19, s9, .placeo7       # Changed t2 to s9
j .pass7

.c8:
beq x20, s7, .placespace8   # Changed t0 to s7
beq x20, s8, .placex8       # Changed t1 to s8
beq x20, s9, .placeo8       # Changed t2 to s9
j .pass8

.c9:
beq x21, s7, .placespace9   # Changed t0 to s7
beq x21, s8, .placex9       # Changed t1 to s8
beq x21, s9, .placeo9       # Changed t2 to s9
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

la s4, space
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


la s4, space
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


la s4, space
mv a0, s4
li a7, 4          # print_string syscall    _
ecall
j .pass3






.placeo4:


la s4, space
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


la s4, space
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


la s4, space
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


la s4, space
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


la s4, space
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


la s4, space
mv a0, s4
li a7, 4          # print_string syscall    _
ecall
j .pass9
