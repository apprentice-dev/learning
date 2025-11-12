BITS 64

.data:
newline db 0x0A

;export our function to the global whatever table (shit gotta reference linkers and loaders book again, whatever man just learn and stop yapping fr)
global calsum_and_print
global _start
global _debugpls
global _debugoffset
global _debugoffsetb4
global _debugoffseta4
global _wheretf
extern _func_convert_unsigned

_start:
push 195
push 200
push 3000
_wheretf:
call calsum_and_print
mov rax, 60    
mov rdi, 0     
syscall       



calsum_and_print:
;push three arguments onto the stack before ebp pls
;thankyou bro
;this serves as the testament and oath that I, retard, will quit my status as a lifelong noob and become a low level c++ and asm master
;I am going to learn bash, vim, cpp, asm, make, cmake and everything about linux kernel 
;idk why am i even doing this but one day when I look back, I might be smiling with ease and alightment, that this is how far I have been
;I know my life has been so bad to the point where I feel like getting cut off from the society,
;But I will do everything in my power to mend everything, with two folds or even 10 folds the effort of normal people, and I am going to start doing it today
;I am on kaioken mode from this day onwards. Mark my words. Linus torvalds, bill gay, and all the saints
;This will be the day I liberate myself from the forever tutorial hell and beginner
;
;random stranger pls dont look at this my inner dialogue is cringe as hell as always
;like please pretend you didnt see this already
;yes this is the main part of my asm program
;
;yeah stfu and get back to work
;okok bro quit pushing on it rn



push rbp
mov rbp, rsp

;dont need any local variables cuz its effectively a one-liner right


;mov rax, [rsp+64*4]
;mov rcx, [rsp+64*3]
;mov rdx, [rsp+64*2]
mov rax, [rsp+8*4]
mov rcx, [rsp+8*3]
mov rdx, [rsp+8*2]


_debugoffset:

mov rbx, 8
mul rbx, 3
sub rsp, rbx

;sum the shit up already, quit procrastinating idiot
;havent you procrastinated enough already
;get to work bro
;ok quit bugging me bro
add rax, rcx
add rax, rdx

;allocate the string and call conversion method we custom coded without help (cap but i didnt use vibe code at least, as you can see with the poor coding style)
;allocate 20 bytes string because max you can get with 64 bit integer is 2^64-1, and that translates to almost 20 digits in decimal and we are printing decimal number


sub rsp, 20;obtain the start address
;i think we need 8 bytes because thats as much as one 64 bit integer can hold
push rsp ;I
push rax
push 20
call _func_convert_unsigned

mov rsi, [rsp+8*2]
mov rdi, 1
mov rdx, 20
_debugoffsetb4:
_debugoffseta4:
mov rax, 1
;mov rsi, rsp ;already did it bevore
syscall

mov rsi, newline
mov rax, 1
mov rdi, 1
mov rdx, 1
syscall

mov rsp,rbp

pop rbp
_debugpls:
ret
