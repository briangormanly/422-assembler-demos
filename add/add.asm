section .data           
    msg db "Value = %d", 10, 0

section .text
    global _start
    extern printf

_start:      
    mov     rbx, 12
    mov     rcx, 14
    add     rbx, rcx

    push eax
    push msg
    call printf
    add rbx, 8

    mov    rax, 60
    mov    rdi, 0
    syscall