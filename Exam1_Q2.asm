;Name: Andrew Kinney
;Description: Demonstrates use of a loop
;Date: 9.28.2021
;Course: Assembly Language Programming
;Assignment: Exam 1 Question 2

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS


.code
main proc ;
	
	call resetRegisters
	
	mov eax, 10
	mov ebx, 0		;ebx is count

	L1:
		dec eax
		inc ebx
		cmp ebx, 10		
		jl L1		;while(count < 10)

	
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