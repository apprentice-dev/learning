BITS 64

.data:
newline db 0x0A

global calsum_and_print
global _start
extern _func_convert_unsigned

_start:
push 195
push 200
push 3000
call calsum_and_print
mov rax, 60    
mov rdi, 0     
syscall       



calsum_and_print:

push rbp
mov rbp, rsp

;dont need any local variables cuz its effectively a one-liner right


;mov rax, [rsp+64*4]
;mov rcx, [rsp+64*3]
;mov rdx, [rsp+64*2]
mov rax, [rsp+8*4]
mov rcx, [rsp+8*3]
mov rdx, [rsp+8*2]



mov rbx, 8
mul rbx, 3
sub rsp, rbx

add rax, rcx
add rax, rdx



sub rsp, 20
push rsp ;I
push rax
push 20
call _func_convert_unsigned

mov rsi, [rsp+8*2]
mov rdi, 1
mov rdx, 20
mov rax, 1
syscall

mov rsi, newline
mov rax, 1
mov rdi, 1
mov rdx, 1
syscall

mov rsp,rbp

pop rbp
ret
