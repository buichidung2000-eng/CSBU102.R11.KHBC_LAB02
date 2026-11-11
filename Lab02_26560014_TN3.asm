# Name: ____________   Student ID: ________
# Purpose: Experiment 3 - bytes, byte order, lb/lbu and capital letters in a string.
# Register plan: $s0 = address of the current data item, $t0-$t4 = loaded bytes/words
.data
word1: .asciiz "Hi!"
w:     .word 0x41424344
b1:    .byte 0xF0
str1:  .asciiz "nguyen van an"
tag:   .asciiz " [end]"
nl:    .asciiz "\n"
.text
.globl main
main:
    la   $s0, word1
    lb   $t0, 0($s0)
    lb   $t1, 1($s0)
    lb   $t2, 2($s0)
    lb   $t3, 3($s0)
    la   $s0, w
    lb   $t0, 0($s0)
    lb   $t1, 1($s0)
    lb   $t2, 2($s0)
    lb   $t3, 3($s0)
    lw   $t4, 0($s0)
    la   $s0, b1
    lb   $t0, 0($s0)        # sign-extended: 0xFFFFFFF0
    lbu  $t1, 0($s0)        # zero-extended: 0x000000F0
    la   $s0, str1
    lb   $t0, 0($s0)
    addi $t0, $t0, -32
    sb   $t0, 0($s0)
    lb   $t0, 7($s0)
    addi $t0, $t0, -32
    sb   $t0, 7($s0)
    lb   $t0, 11($s0)
    addi $t0, $t0, -32
    sb   $t0, 11($s0)
    li   $v0, 4
    add  $a0, $s0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    li   $v0, 10
    syscall
