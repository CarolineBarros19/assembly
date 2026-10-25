.data
    n1:    .asciiz "\nDigite a nota 1: "
    n2:    .asciiz "\nDigite a nota 2: "
    n3:    .asciiz "\nDigite a nota 3: "
    n4:    .asciiz "\nDigite a nota 4: "
    m:     .asciiz "\nA média é "
    aprov: .asciiz "\nAPROVADO"
    exame: .asciiz "\nEXAME"
    ret:   .asciiz "\nRETIDO"

.text
main:
    li   $v0, 4
    la   $a0, n1
    syscall
    li   $v0, 5
    syscall
    add  $t0, $v0, $zero

    li   $v0, 4
    la   $a0, n2
    syscall
    li   $v0, 5
    syscall
    add  $t1, $v0, $zero

    li   $v0, 4
    la   $a0, n3
    syscall
    li   $v0, 5
    syscall
    add  $t2, $v0, $zero

    li   $v0, 4
    la   $a0, n4
    syscall
    li   $v0, 5
    syscall
    add  $t3, $v0, $zero

    # soma das 4 notas
    add  $t4, $t0, $t1
    add  $t4, $t4, $t2
    add  $t4, $t4, $t3

    # media = soma / 4
    li   $t8, 4
    div  $t4, $t8
    mflo $t5                 

    # exibe a media
    li   $v0, 4
    la   $a0, m
    syscall
    li   $v0, 1
    move $a0, $t5             # valor a imprimir vai em $a0
    syscall

    # media >= 6 ?
    li   $t7, 6
    bge  $t5, $t7, l_aprov

    # media >= 3 ?
    li   $t7, 3
    bge  $t5, $t7, l_exame

    # media < 3
    li   $v0, 4
    la   $a0, ret
    syscall
    j    exit

l_aprov:
    li   $v0, 4
    la   $a0, aprov
    syscall
    j    exit

l_exame:
    li   $v0, 4
    la   $a0, exame
    syscall

exit:
    li   $v0, 10
    syscall