BITS 64
section .text

global calsum_proc
global _start

_start:
    ; Push arguments onto the stack
    push 1
    push 2
    push 3
    call calsum_proc

    ; Clean up the stack
    add rsp, 24

    ; Exit program
    mov rax, 60         ; syscall number for exit
    xor rdi, rdi        ; exit code 0
    syscall

calsum_proc:
    ; Set up stack frame
    push rbp
    mov rbp, rsp

    ; Load arguments from the stack
    mov rax, [rbp+32]   ; Argument 3
    mov rcx, [rbp+24]   ; Argument 2
    mov rdx, [rbp+16]   ; Argument 1

    ; Compute sum
    add rax, rcx
    add rax, rdx
    mov rax, 0x41

    ; Write result to stdout
    sub rsp, 8          ; Align stack to 16 bytes
    mov [rsp], rax      ; Store result on the stack
    mov rax, 1          ; syscall number for write
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, rsp        ; pointer to the buffer
    mov rdx, 8          ; size of the buffer
    syscall
    add rsp, 8          ; Restore stack alignment

    ; Tear down stack frame
    pop rbp
    ret
