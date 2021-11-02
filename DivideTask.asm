;Name: Andrew Kinney
;Description: Checks whether or not a number is divisible by another, if it is, eax gets 1, otherwise 0
;Date: 9.21.2021
;Course: Assembly Language Programming
;Assignment: n/a

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

divisor dword 2
dividend dword 7

.code
main proc ;
	
	call resetRegisters
	call setDividend
	call setValue
	call divisibleCheck


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
	
setDividend proc
	mov eax, dividend
ret
setDividend endp

setValue proc
	div divisor
ret
setValue endp

divisibleCheck proc
	;if edx = 0, it's divisible
	
	mov eax, 0 ;assume eax is not divisible
	
	cmp edx, 0
	je L1
	jmp L2
	
	L1:
		mov eax, 1
	L2: 
ret
divisibleCheck endp


end main