; nasm -felf32 -o soma.o soma.asm
; ld -melf_i386 -o soma soma.o
; as operacoes de calculo geralmente sao feitas pelos registradores


section .text
global _start

soma: ; int soma(int x, int y) { return x + y; }
	mov eax, [esp+4] ; esp = 0xfffff -> ret
	mov ebx, [esp+8]
	add eax, ebx ; eax = eax + ebx
	ret	
 
_start:
	push ebp ;salvando o stack frame anterior
	mov ebp, esp ; topo da pilha igual a base do stack frame atual
	sub ebp, 4; int i; in c

;soma(3,4)
	push 3
	push 4
	call soma
	add esp, 8 ; quem chamou a funcao é quem tem q limpar a stack

	add eax, 0x30
	mov[ebp-4], eax ; variavel local 
 
;write
	mov edx, 1
	lea ecx, [ebp-4] ; lea - coloca o endereco
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	pop ebp

;exit
	mov eax , 1 ; NR_exit -- unistd.h
	mov ebx , 0 ; int status
	int 0x80 ; interrupcao de software, detalhe do linux

