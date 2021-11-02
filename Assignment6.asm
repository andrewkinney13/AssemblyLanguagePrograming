;Name: Andrew Kinney
;Description: Adds two numbers together that were entered by the user
;Date: 10.1.2021
;Course: Assembly Language Programming
;Assignment: Assignment 6

include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

prompt byte "Enter the first number: ",0
promptTwo byte "Enter the second number: ",0 
finalMsg byte "The two numbers combined are: ",0


.code
main proc ;
	
	call resetRegisters

	;Enter two numbers, add them together, print them

	mov edx, offset prompt
	call WriteString
	
	call ReadDec
	
	mov ebx, eax 
	
	mov edx, offset promptTwo
	call WriteString
	call ReadDec

	add eax, ebx

	mov edx, offset finalMsg
	call WriteString
	call WriteDec





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
