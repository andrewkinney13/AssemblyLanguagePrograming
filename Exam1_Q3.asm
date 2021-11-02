;Name: Andrew Kinney
;Description: Determines whether or not a number is even or odd
;Date: 9.28.2021
;Course: Assembly Language Programming
;Assignment: Exam 1 Question 3

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

evenCheck dword 02d;

.code
main proc ;
	
	call resetRegisters

	mov eax, 6
	div evenCheck
	cmp edx, 0		;if remainder is 0, it's even
	je L1
	jmp L2

	L1:
		mov ebx, 1
		jmp endProgram

	L2:
		mov ebx, 0

	
endProgram:
invoke ExitProcess,0 ;just means return 0, exit_success 	
main endp

;FUNCTION ZONE

resetRegisters proc
	;reset registers
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
ret
resetRegisters endp




end main