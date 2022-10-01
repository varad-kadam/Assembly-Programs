.data
txt: .asciiz "*"
newline: .asciiz "\n"

.text
main:
li $t0, 3
li $t1, 0
li $t2, 0

outer_loop:
    ble $t0, $t1, exit
    j line_loop
    
line_loop:
    blt $t1, $t2, newline_loop
    li $v0, 4
    la $a0, txt
    syscall
    add $t2, $t2, 1
    j line_loop
    
newline_loop:
    li $v0, 4
    la $a0, newline
    syscall
    add $t1, $t1, 1
    
    li $t2, 0
    j outer_loop

exit: li $v0, 10