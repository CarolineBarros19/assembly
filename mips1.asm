#ex1 - receba os valores do comprimento, largura e altura de um paralelepípedo. Calcule e mostre seu volume.

.data
     comp: .asciiz "\nDigite o comprimento: "
     larg: .asciiz "\nDigite a largura: "
     alt: .asciiz "\nDigite a altura: "
     res: .asciiz "\nO resultado é "

.text
main: 

#lendo as variáveis

     li $v0, 4
     la $a0, comp 
     syscall
     li $v0, 5
     syscall
     add $t0, $v0, $zero

      li $v0, 4
     la $a0, larg 
     syscall
     li $v0, 5
     syscall
     add $t1, $v0, $zero

     li $v0, 4
     la $a0, alt 
     syscall
     li $v0, 5
     syscall
     add $t2, $v0, $zero

    mul $t3, $t0, $t1
    mul $t3, $t2, $t3

#resultado

   li $v0, 4
   la $a0, res
   syscall
   li $v0, 1
   add $a0, $t3, $zero
   syscall

# encerra programa com comando 10
   li $v0, 10
   syscall