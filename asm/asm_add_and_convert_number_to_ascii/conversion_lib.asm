;assume all 64 bits cuz 32 bits and 16 bits are ohio and i am a noob
;I am so noob that I am still working on basic x86_64 application after all this time
;path to os and kernel dev bro, stay viligant


BITS 64

global _func_convert_signed
global _func_convert_unsigned


.text:

;our integer to ascii conversion method (omg pls fix fixed offset and make it a proper function)

;push arguments in stack and then call _func_convert
;no using registers for arguments for now, and all variables follow the high to low instead of c order
;yes devilish naming cuz I like unreadability like in gcc, it cool makes you very mysterious and esoteric or niche feeling

_start:  
sub rsp, 8
mov r11, rsp
;lea r11, [rsp+7]
push r11 ;give the high address of the string so the procedure writes from hi to lo
push 67676767
push 8

call _func_convert_unsigned
_debugaftercall:
mov rax, 1
mov rdi, 1
mov rsi, [rsp+8*2]
mov rdx, 8
_debugbeforesyscall:
syscall
mov rax, 60
mov rdi, 0
syscall

;
; function: convert signed numbers only

; argument 1: push first, it is the string address you just allocated on the stack, make sure you have allocated
; enough space for stirng or else it will go out of bound

; argument 2: the nubmer itself that you want to convert to a string
; 
; argument 3: size of the string you just allocated on the stack 
;
; returns (nothing), if it ever goes out of bound its on you :)

_func_convert_unsigned: ; i aint dealing with no 2's complement oml :sob: not yet the time
;prologue
push rbp
mov rbp, rsp
_debugpls:

mov rsi, [rsp+8*3] ; $rsi is the number you want to convert
mov r11, rsi
mov rdi, [rsp+8*4]; $rdi is the string (one byte for each power of 10)
mov rbx, [rsp+8*2]
add rdi, rbx
sub rdi, 1
;deal with the number (keep testing 2 then adding to result)

;bro are you fucking retarded
;just keep dividing the dividend by 10, then use remainder as dividend you ninger
mov r10, 10 ;lowest number and keep dividing by 10 to obtain LSB for printing


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
sub rdi, 1 ; reverse writing order (From high to low like stack), because we essentially write from lsb digits

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
