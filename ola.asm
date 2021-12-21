
; write ----- ssize_t write(int fd, const void *buf, size_t count); possui 3 argumentos
; ssize_t read(int fd, void *buf, size_t count);

section .data
msg: db "www.mentebinaria.com.br" , 0x0a ;or 10 in decimal 
tam: equ $-msg

;msg - [label da msg
;-(menos)
;$ - posicao atual
;equ - igual

section .text
global _start

_start: ; exit(0)



mov edx, tam ;count
mov ecx, msg ;*buf
mov ebx, 1 ;fd
mov eax, 4 ;write
int 0x80

;void _exit(int status); possui apenas um argumento

mov ebx, 0 ; codigo do retorno da exit() , reistrador ebx
mov eax, 1 ; codigo da syscall exit() ,  registrador eax, move o syscall 1 para o registrador eax

int 0x80 ; parada

