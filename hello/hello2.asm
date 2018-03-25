global _start

; Data section
section .data
	align 2
	str: db 'Hello world', 0xA
	len: equ $-str
	
section .bss

; code section
section .text
	_start:
	; write(int fd, const void *buf, size_t count)
	mov edx, len
	mov ecx, str
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	mov ebx, 0
	mov eax, 1
	int 0x80	