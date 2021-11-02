;Name: Andrew Kinney
;Description: Maniupulates some registers, uses add and subtract
;Date: 9.21.2021
;Course: Assembly Language Programming
;Assignment: Exam 1 Question 1

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS


.code
main proc ;
	
	call resetRegisters
	
	mov eax, 100	;1
	
	mov ebx, 110	;2
	add ebx, 120

	mov eax, 0		;3
	mov eax, 110
	sub eax, 120

	
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