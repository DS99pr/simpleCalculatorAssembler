FIRST_NUM equ 34
SECOND_NUM equ 5
DIVISOR equ 10

section .data
 ADD_EXPRESSION db '34 + 5 =', 0
 SUB_EXPRESSION db '34 - 5 =', 0
 NEW_LINE db 0x0A
 ADD_RESULT db '00', 0
 SUB_RESULT db '00', 0
 
section .text
global _start

%macro printf 2
 mov rax, 1
 mov rdi, 1
 mov rsi, %1
 mov rdx, %2
 syscall
%endmacro 

_start:

 ; logging

 printf ADD_EXPRESSION, 9

 ; adding

 mov al, FIRST_NUM
 add al, SECOND_NUM
 mov cl, DIVISOR
 div cl
 add al, '0'
 mov [ADD_RESULT], al
 
 add ah, '0'
 mov [ADD_RESULT+1], ah
 
 ; subtraction
 
 mov al, FIRST_NUM
 sub al, SECOND_NUM
 xor ah, ah
 mov cl, DIVISOR
 div cl
 add al, '0'
 mov [SUB_RESULT], al
 
 add ah, '0'
 mov [SUB_RESULT+1], ah
 
 ; logging ver 2
 
 printf ADD_RESULT, 2
 printf NEW_LINE, 1
 printf SUB_EXPRESSION, 9
 printf SUB_RESULT, 2
 mov rax, 60
 mov rdi, 0
 syscall
 
