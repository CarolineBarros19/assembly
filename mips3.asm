#Receba 2 valores inteiros. Calcule e mostre o resultado da diferença do maior pelo menor valor

.data
    v1: .asciiz "\nDigite um valor: "
    v2: .asciiz "\nDigite outro valor: "
    res: .asciiz "\nA diferença é "

.text
main:

    li $v0, 4
    la $a0, v1
    syscall
    li $v0, 5
    syscall
    add $t0, $v0, $zero

    li $v0, 4
    la $a0, v2
    syscall
    li $v0, 5
    syscall
    add $t1, $v0, $zero

    #estrutura de decisão branch if greater than
    bgt $t0, $t1, t0_maior
    sub $t2, $t1, $t0
    j exit

   t0_maior:
   sub $t2, $t0, $t1

   exit:
   li $v0, 4
   la $a0, res
   syscall
   
   li $v0, 1
   add $a0, $t2, $zero
   syscall

  li $v0, 10
  syscall