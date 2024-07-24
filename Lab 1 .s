.text

main:
    la  $a0,num_msg
    li  $v0,4
    syscall

#taking input of the number
    li  $v0,5
    syscall
    move    $t0,$v0

    li  $t1,2
    la  $a0,final_msg
    li  $v0,4
    syscall
    b   gotoloop


# explicit function for the loop 
gotoloop:
    bgt $t1,$t0,exit
    div $t0,$t1
    mfhi $t2
    beq $t2,$zero,yes_equal
    addi $t1,$t1,1
    b gotoloop

# function when reminder is zero
yes_equal:
    la $a0,0($t1)
    li $v0,1
    syscall
    la  $a0,space
    li  $v0,4
    syscall
    mflo    $t0
    b gotoloop

exit:
    li  $v0,10
    syscall

.data
num_msg: .asciiz "Enter a number: "
final_msg: .asciiz  "The prime factorials are: "
space:  .asciiz "  "