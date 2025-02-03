section .data
    msg db "Hello, World!", 0xA  ; Message to print with a newline
    len equ $ - msg              ; Calculate the length of the message

section .text
    global _start

_start:
    ; syscall: write(1, msg, len)
    mov eax, 1
    mov edi, 1      ; file descriptor 1 (stdout)
    mov rsi, msg    ; pointer to message
    mov edx, len    ; message length
    syscall         ; invoke syscall

    ; syscall: exit(0)
    mov eax, 60     ; syscall number for sys_exit
    xor edi, edi    ; status 0
    syscall         ; invoke syscall
