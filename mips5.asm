#Receba 2 números inteiros, verifique qual o maior entre eles. Calcule e mostre o resultado da somatória dos números ímpares entre esses valores

.data
    v1: .asciiz "\nDigite um número inteiro: "
    v2: .asciiz "\nDigite outro número inteiro: "
    soma: "\nA soma dos ímpares entre eles é "
    
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

    bge $t0, $t1, maior
    add $t2, $t1, $zero
    add $t3, $t0, $zero
    j calcula

   maior:
      addi $t4, $t3, 1
      li $t5, 0
      
   calcula:
    addi $t4, $t3, 1          
    li   $t5, 0              

   loop:
      bge $t4, $t2, fim_loop
      andi $t6, $t4, 1
      beq $t6, $zero, próximo
      add $t5, $t5, $t4

   próximo:
      addi $t4, $t4, 1
      j loop
  
   fim_loop:
       li $v0,4
       la $a0, soma
       syscall
       li $v0, 1
       move $a0, $t5
       syscall

   li $v0, 10
   syscall  