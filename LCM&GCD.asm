.globl main
main:

.data
msg0: .asciiz "\n"
msg1: .asciiz "Enter the first number: "
msg2: .asciiz "Enter the second number: "
msg3: .asciiz "The LCM (Least Common Multiple is: "
msg4: .asciiz "The GCD (Greatest Common Denominator is: "
msg5: .asciiz "Both the numbers are equal, the LCM & GCD is: "

.text

# Input Numbers
la $a0 msg1
li $v0 4
syscall

li $v0 5
syscall
move $s0 $v0 #First Number

la $a0 msg2
li $v0 4
syscall

li $v0 5
syscall
move $s1 $v0 #Second Number

## LCM:
# Max
beq $s0 $s1 same
    blt $s0 $s1 max_s1
        la $s2 ($s0) #Max
        j calc

    max_s1:
    la $s2 ($s1) #Max
    j calc 

same:
la $a0 msg5
li $v0 4
syscall

la $a0 ($s0)
li $v0 1
syscall
j exit

calc:
div $s2 $s0
mfhi $t0

div $s2 $s1
mfhi $t1

beq $t0 0 calc1
add $s2 $s2 1
j calc

calc1:
beq $t1 0 calc2
add $s2 $s2 1
j calc

calc2:
la $a0 msg3
li $v0 4
syscall

la $a0 ($s2)
li $v0 1
syscall

##GCD:
mult	$s0, $s1			
mflo	$t2					

div		$t2, $s2			
mflo	$s3					

la $a0 msg0
li $v0 4
syscall

la $a0 msg4
li $v0 4
syscall

la $a0 ($s3)
li $v0 1
syscall
j exit

exit: li $v0 10
syscall

