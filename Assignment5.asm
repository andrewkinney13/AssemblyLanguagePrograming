;Name: Andrew Kinney
;Description: Converts from centigrade to fahrenheit
;Date: 9.24.2021
;Course: Assembly Language Programming
;Assignment: Assignment 5

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

centigrade dword 5
fahrenheit dword 41
A dword 5
B dword 9

.code
main proc ;
	
	call resetRegisters

	mov eax, centigrade
	call convertCentToFar

	mov eax, fahrenheit
	call convertFarToCent


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


convertCentToFar proc
	mul B
	div A
	add eax, 32
	mov ebx, eax
ret
convertCentToFar endp

convertFarToCent proc
	sub eax, 32
	mul A
	div B
	mov ebx, eax
ret
convertFarToCent endp


end main