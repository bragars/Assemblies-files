section .text
global _start

_start: ; return 1



mov ebx, 1 ; codigo do retorno da exit() , reistrador ebx
mov eax, 1 ; codigo da syscall exit() ,  registrador eax, move o syscall 1 para o registrador eax

int 0x80 ; parada
