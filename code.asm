.data
prompt:             .asciiz "Enter an integer (N >= 25): "
error_display:      .asciiz "Invalid Number! Please enter N >= 25\n"
fib_display:        .asciiz "Fibonacci Sequence:\n"

.text
main:
    j input_loop     # Jump to input loop

input_loop:
    li $v0, 4         # Print prompt
    la $a0, prompt
    syscall

    li $v0, 5         # Read an integer
    syscall
    move $t0, $v0

    bge $t0, 25, fibonacci_sequence  # Check if N >= 25

    li $v0, 4         # Print error message
    la $a0, error_display
    syscall
    j input_loop

fibonacci_sequence:
    li $t1, 0         # Initialize Fibonacci variables
    li $t2, 1
    li $t3, 0

    li $v0, 4         # Print Fibonacci display message
    la $a0, fib_display
    syscall

fibonacci_loop:
    li $v0, 1         # Print current Fibonacci number
    move $a0, $t1
    syscall

    add $t4, $t1, $t2  # Calculate next Fibonacci number
    move $t1, $t2
    move $t2, $t4
    addi $t3, $t3, 1

    li $v0, 11        # Print a space
    li $a0, 32
    syscall

    bge $t3, $t0, exit_code  # Exit loop if done
    j fibonacci_loop

exit_code:
    li $v0, 1         # Print final Fibonacci number
    move $a0, $t1
    syscall

    li $v0, 10        # Exit program
    syscall
