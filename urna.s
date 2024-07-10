.data
    newline: .asciiz "\n"
    # Senha para encerrar o programa
    ENCERRAR: .word 12345
    # Array com o nome dos candidatos e quantidade de votos, simula um dicionário onde os índices são as keys
    candidatos: .asciiz "C1", "C2", "C3", "Nulo"
    votos: .word 0, 0, 0, 0, 0 # C1, C2, C3, Nulo, Branco
    msg_confirmar: .asciiz "Aperte confirmar (C) ou Branco (B): "
.text
.globl main
main:
    # Carrega o endereço da variável 'encerrar' em $t0
    la $t0, ENCERRAR
    # Carrega o valor da variável 'encerrar' em $s0
    lw $s0, 0($t0)
    # Inicializa a variável voto
    li $t1, -1          # $t0 = valor do voto do usuário
    
loop:
    # verifica a condição do loop: voto != ENCERRAR
    beq	$s0, $t1, end_loop	# if $t0 == $t1 then sai do loop

    # ----------- Corpo do loop: recebe o voto do usuário
    li $t1, 0 # simula que o usuário digitou 0 (C1)
    # Imprimir a mensagem de confirmar voto
    li $v0, 4
    la $a0, msg_confirmar
    syscall
    # Imprimir quebra de linha
    li $v0, 4
    la $a0, newline
    syscall
    
    li $t1, 0 # simula que o usuário digitou 12345 (C1)

    # Salta de volta para o início do loop
    j loop
    
end_loop:
    # Fim do programa
    li $v0, 10         # Código da syscall para sair do programa
    syscall    

BRANCO:
CONFIRMAR: