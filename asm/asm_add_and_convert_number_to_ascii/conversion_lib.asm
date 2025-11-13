; Conversion library for unsigned and signed integers to ASCII representation
; Written for 64-bit x86_64 architecture

BITS 64

global _func_convert_signed
global _func_convert_unsigned


.text:

; Test main function that wont be executed
_start:  
sub rsp, 8 ;allocate 8 bytes on 
mov r11, rsp
push r11 ;give the high address of the string so the procedure writes from hi to lo
push 67676767
push 8

call _func_convert_unsigned
mov rax, 1
mov rdi, 1
mov rsi, [rsp+8*2]
mov rdx, 8
syscall

mov rax, 60
mov rdi, 0
syscall

; Integer to ASCII conversion function for unsigned integers
; Arguments (pushed onto the stack in reverse order):
;   1. Address of the string buffer to store the result (high address first)
;   2. The number to convert
;   3. Size of the string buffer
; Returns: No return value (result is stored in the provided buffer)
_func_convert_unsigned: 
;prologue
push rbp
mov rbp, rsp

; Extract arguments from the stack
mov rbx, [rsp+8*2] ; Extract the first argument to rbx (buffer address)
mov rsi, [rsp+8*3] ; Extract the second argument to rsi (the number ot be converted)
mov rdi, [rsp+8*4]; Extract the third argument to rdi (the size of the buffer (cuz) we write in reverse order, but no out of bounds check)
mov r11, rsi
add rdi, rbx
sub rdi, 1
mov r10, 10 ;lowest number and keep dividing by 10 to obtain LSB for printing

;to be annotated
while_still_has_flag:
;div r11, r10
mov rax, r11
mov r9, 0x1111111100000000
and r9, r11
mov rdx, r9
div r10 
or rdx, rdx
jz else ;rax = quotient, rdx = remainder, we get remainder for printing digits

if_has_data:

;print decimal number
mov r8, rdx
add r8, 48
mov r12, [rdi]
mov byte [rdi], r8b
or [rdi], r12
sub rdi, 1 

else:
mov r11, rax 
or r11, r11
jnz while_still_has_flag

;we are done yay, lets end it
debugagain:

;epilogue
mov rsp, rbp
pop rbp
ret


; WARNING: INCOMPLETE
_func_convert_signed:
;prologue
push rbp
mov rbp, rsp

mov rax, 0x60
mov rdi, 6767
syscall







;epilogue
mov rsp, rbp
pop rbp
ret
