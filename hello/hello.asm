section .data			; create constants here
    msg db "hello, world!", 0xA		; Create a constant string of bytes (labeled msg) 
    								; the 0xA is a new line character added to the end

section .text			; code goes here
    global _start		; global is NASM specific, the linker will read the symbol (_start) 
    					; to know where the entry point of the executable is

_start:					; entry point of the executable

						; To output text to the screen we are going to make a system
						; call to the linux operating system (os specific!) 
						; The call we want to make is to sys_write
						; Calls to sys_write require 3 parameters: a file descriptor, 
						; message to write and the message length
						; Example call in C:
						; sys_write(unsigned int fd, const char * buf, size_t count)
						; To Do this in assembly, we need to load the parameters into 
						; the registers that the information will be expected in, and
						; make the system call 
						; see: 
						
    mov     rax, 1		; load value 1 in rax (register) this is the syscall number
    mov     rdi, 1		; Used to pass 1st argument (file descriptor)
    mov     rsi, msg	; Used to pass 2nd argument (message to write)
    mov     rdx, 14		; Used to pass 3rd argument (message length) Note: +1 for newline
    syscall				; Make the call to linux (sys_write) triggers software interupt 

    					; Now we are going to make another system call, this time 
    					; to exit: sys_exit(int )

    mov    rax, 60		; load value 60 (syscall number) you can also use 0x3C
    mov    rdi, 0		; Used to pass 1st argument (error code)
    syscall				; Make the call to linux (sys_exit)