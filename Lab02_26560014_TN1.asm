# Name: ____________   Student ID: ________
# Purpose: Experiment 1 - variables in memory (varA = varB + varC) and base + offset access to an array.
# Register plan: $t0 = address of varB, $t1 = varB, $t2 = varC, $t3 = sum, $s0 = address of scores[0]
.data
varB:   .word 25
varC:   .word 17
varA:   .word 0
scores: .word 40, 55, 70, 85, 100
.text
.globl main
main:
    la   $t0, varB
    lw   $t1, 0($t0)       # $t1 = varB
    lw   $t2, 4($t0)       # $t2 = varC
    add  $t3, $t1, $t2     # $t3 = varB + varC
    sw   $t3, 8($t0)       # varA = $t3
    la   $s0, scores
    lw   $t0, 0($s0)       # scores[0]
    lw   $t1, 4($s0)       # scores[1]
    lw   $t2, 16($s0)      # scores[4]
    addi $s1, $s0, 8       # $s1 = address of scores[2]
    lw   $t3, 0($s1)       # scores[2]
    lw   $t4, -4($s1)      # scores[1]
    li   $v0, 10
    syscall
