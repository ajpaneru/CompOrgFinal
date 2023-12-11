.data
prompt:             .asciiz "Enter an integer (N >= 25): "
error_display:      .asciiz "Illegal Number! Please Write valid numbers i.e (N >= 25) \n"
fib_display:        .asciiz "Fibonacci Sequence:\n"

.text
main:
    j input_loop

input_loop:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    bge $t0, 25, fibonacci_sequence

    li $v0, 4
    la $a0, error_display
    syscall
    j input_loop

fibonacci_sequence:
    li $t1, 0
    li $t2, 1
    li $t3, 0

    li $v0, 4
    la $a0, fib_display
    syscall


fibonacci_loop:
    li $v0, 1
    move $a0, $t1
    syscall

    add $t4, $t1, $t2
    move $t1, $t2
    move $t2, $t4
    addi $t3, $t3, 1

    li $v0, 11
    li $a0, 32
    syscall

    bge $t3, $t0, exit_code
    j fibonacci_loop


exit_code:
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall
