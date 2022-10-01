.globl main
main:

.data
array: .space 40
msg0: .asciiz "How many number should the array hold? "
msg1: .asciiz "Enter a number to add to the array: "
msg3: .asciiz "The array is: "
msg4: .asciiz "The number of even numbers are: "
msg5: .asciiz "The number of odd numbers are: "
msg10: .asciiz "\n"
msg11: .asciiz "\t"


.text
add $t0, $zero, 0 # Input Array Incrementer
add $t1, $zero, 0 # Input Incrementer
add $t2, $zero, 0 # Print Array Incrementer
add $t3, $zero, 0 # Print Incrementer
add $t4, $zero, 0 # Odd/Even Hold
add $t5, $zero, 2 # Divide by 2
add $t6, $zero, 0 # Hold Zero for Odd/Even
add $s0, $zero, 0 # Size of Array
add $s1, $zero, 0 # Printer
add $s2, $zero, 0 # Even Count 
add $s3, $zero, 0 # Odd Count
    
j size

exit: li $v0, 10
syscall



# Input Size of the Array
size:    
    la $a0, msg0    
    li $v0, 4	
    syscall 

    li $v0, 5	
    syscall 
    move $s0, $v0

    la $a0, msg10    
    li $v0, 4	
    syscall 

    j input
    
# Input Elements of the Array
input:
ble $s0, $t1, initial_print
    
    la $a0, msg1    
    li $v0, 4	
    syscall 

    li $v0, 5	
    syscall 
    sw $v0, array($t0)
    
    add $t0, $t0, 4
    add $t1, $t1, 1
    j count

# Print Elements of the Array
initial_print:
    la $a0, msg10   
    li $v0, 4	
    syscall 
    
    la $a0, msg3    
    li $v0, 4	
    syscall 
    
    la $a0, msg10   
    li $v0, 4	
    syscall 

    j print

print:
ble $s0, $t3, final    

    lw $s1, array($t2)
    la $a0, ($s1)
    li $v0, 1
    syscall

    la $a0, msg11    
    li $v0, 4	
    syscall 

    add $t2, $t2, 4
    add $t3, $t3, 1
    j print

# Print Even & Odd
final:
    la $a0, msg10    
    li $v0, 4	
    syscall 
    
    la $a0, msg10    
    li $v0, 4	
    syscall 
    
    la $a0, msg4    
    li $v0, 4	
    syscall

    la $a0, ($s2)
    li $v0, 1
    syscall

    la $a0, msg10    
    li $v0, 4	
    syscall 

    la $a0, msg5    
    li $v0, 4	
    syscall

    la $a0, ($s3)
    li $v0, 1
    syscall

    j exit

#Incrementing Odd & Even  
count:    
    div $v0, $t5
    mfhi $t4
    blt $t4, 1, even
        add $s3, $s3, 1
        j input
    
    even:
        add $s2, $s2, 1
        j input



