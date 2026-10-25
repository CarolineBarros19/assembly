.data
    num:     .asciiz "\nDigite um numero positivo: "
    invalido: .asciiz "\nNumero negativo. Digite novamente."
    numMaior: .asciiz "\nMaior valor: "
    numMenor: .asciiz "\nMenor valor: "

.text
main:
    li   $t0, 0               # t0 = contador de numeros validos
    li   $t1, 0               # t1 = maior
    li   $t2, 0               # t2 = menor
    li   $t7, 10              # t7 = limite de leituras

loop:
    bge  $t0, $t7, fim        # se leu 10 numeros validos, sai

leitura:
    li   $v0, 4
    la   $a0, num
    syscall
    li   $v0, 5
    syscall
    move $t3, $v0             # t3 = numero digitado

    bltz $t3, negativo        # se t3 < 0, desconsidera

    bne  $t0, $zero, compara  # se nao e o 1o numero, compara
    move $t1, $t3             # 1o numero: e o maior e o menor
    move $t2, $t3
    j    proximo

compara:
    ble  $t3, $t1, testa_menor  # se t3 <= maior, nao muda o maior
    move $t1, $t3               # novo maior

testa_menor:
    bge  $t3, $t2, proximo      # se t3 >= menor, nao muda o menor
    move $t2, $t3               # novo menor

proximo:
    addi $t0, $t0, 1          # contador++
    j    loop

negativo:
    li   $v0, 4
    la   $a0, invalido
    syscall
    j    leitura              # pede de novo, sem incrementar o contador

fim:
    li   $v0, 4
    la   $a0, numMaior
    syscall
    li   $v0, 1
    move $a0, $t1
    syscall

    li   $v0, 4
    la   $a0, numMenor
    syscall
    li   $v0, 1
    move $a0, $t2
    syscall

    li   $v0, 10
    syscall