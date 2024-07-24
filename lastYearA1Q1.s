.text

main:
    la  $a0, entryMsg                # entry message
    li  $v0, 4
    syscall

    li  $v0, 5
    syscall
    move    $t0, $v0                 # input to the $t0

    blt     $t0, $zero, negativeNum

    li  $t1, 0
    li  $t2, 10
    b   start

start:
    bgt     $t0, $zero, loop
    ble     $t0, $zero, printans

# addition of digits
loop:
    div     $t0, $t2
    mfhi    $t3
    add     $t1, $t1, $t3
    mflo    $t0
    b       start

# condition for a negative number input
negativeNum:
    la  $a0, negativeMsg
    li  $v0, 4
    syscall
    b       exit

printans:
    la  $a0, final_msg
    li  $v0, 4
    syscall

    move    $a0, $t1
    li      $v0, 1
    syscall
    b       exit

# exit label for the code
exit:
    li  $v0, 10
    syscall

.data
entryMsg:   .asciiz "Enter a positive number: "
negativeMsg: .asciiz "The number you have entered is a negative number."
final_msg:  .asciiz "The sum of digits of the given number is: "
