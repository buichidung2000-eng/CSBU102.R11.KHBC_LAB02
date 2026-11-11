# Name: ____________   Student ID: ________
# Purpose: Experiment 2 - own data (store V into scores[k], total of five scores), then swap scores[0] and scores[4].
# Register plan: $s0 = address of scores[0], $s1 = k, $s4 = V, $s3 = total, $t0/$t1 = temporaries
# NOTE: replace k and V below with YOUR values from Table 9 (D = last digit of your student ID).
# For the Listing 3 screenshot (100 55 70 85 40) run the swap part alone on the original array.
.data
scores: .word 40, 55, 70, 85, 100
msg:    .asciiz "Total: "
nl:     .asciiz "\n"
.text
.globl main
main:
    la   $s0, scores
    addi $s1, $zero, 4      # k = 4
    addi $s4, $zero, 59     # V = 59
    sll  $t1, $s1, 2       # $t1 = 4 * k
    add  $t1, $t1, $s0      # $t1 = address of scores[k]
    sw   $s4, 0($t1)        # scores[k] = 59

    lw   $t0, 0($s0)
    add  $s3, $zero, $t0	
    lw   $t0, 4($s0)
    add  $s3, $s3, $t0
    lw   $t0, 8($s0)
    add  $s3, $s3, $t0
    lw   $t0, 12($s0)
    add  $s3, $s3, $t0
    lw   $t0, 16($s0)
    add  $s3, $s3, $t0
    li   $v0, 4
    la   $a0, msg
    syscall
    li   $v0, 1
    add  $a0, $s3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    # Step 2.1: swap scores[0] and scores[4]
    lw   $t0, 0($s0)
    lw   $t1, 16($s0)
    sw   $t1, 0($s0)
    sw   $t0, 16($s0)
    li   $v0, 10
    syscall
