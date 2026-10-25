 #Receba o raio de uma circunferência. Calcule e mostre o comprimento da circunferência.
 #Considere PI = 3. C= 2pi.r

.data
    r: .asciiz "\nDigite o raio: "
    cir: .asciiz "\no Comprimento da circunferência é "
    
.text
main:
     
    li $v0, 4
    la $a0, r
    syscall
     
    li $v0, 5
    syscall
    add $t0, $v0, $zero

    li $t1, 2
    li $t2, 3
    mul $t3, $t2, $t1
    mul $t3, $t0, $t3
   
    li $v0, 4
    la $a0, cir
    syscall
    li $v0, 1
    add $a0, $t3, $zero
    syscall

    li $v0, 10 
    syscall