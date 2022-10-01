# This is My First Program:

.data
string1: .asciiz "Hello World."

.text
main:
li $v0, 4
la $a0, string1
syscall

li $t0, 10
li $t1, 3
div $t0, $t1
mfhi $a1
move $a0, $a1
li $v0, 1
syscall