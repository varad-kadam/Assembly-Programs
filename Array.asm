.data

list: .word 1,2,3,4,56,7,8,9,10
size: .word 10

.text

lw $t3, size
la $t1, list
li $t2, 0 

print_loop:
beq $t2, $t3, print_loop_end 
lw $a0, ($t1)
li $v0, 1
syscall

addi $t2,$t2, 1
addi $t1,$t1, 4
j print_loop
print_loop_end:

exit: