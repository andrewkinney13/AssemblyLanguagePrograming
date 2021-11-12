;Name: Andrew Kinney
;Description: Greatest common divisor program, finds the GCD of two integers!
;Date: 11.12.2021
;Course: Assembly Language Programming
;Assignment: Assignment 13a

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

temp dword ?	
remainder1 dword ?
remainder2 dword ?

.code
main proc ;
	
	call ResetRegisters

	;input, ebx is x, eax is y
	mWrite"Please enter the first integer: "
	call ReadDec
	mov ebx, eax

	mWrite"Please enter the second integer: "
	call ReadDec

	;find GCD

	cmp eax, ebx
	jl setDivisorEAX
	jmp setDivisorEBX
	setDivisorEAX:
		mov ecx, eax
		jmp GCDLoop
	setDivisorEBX:
		mov ecx, ebx

	GCDLoop:
		mov temp, eax
		mov edx, 0

		div ecx
		mov remainder1, edx

		mov edx, 0
		mov eax, ebx
		div ecx
		mov remainder2, edx

		cmp remainder1, 0
		je rem2Check
		jmp endOfLoop
		rem2Check:
			cmp remainder2, 0
			je L5
			jmp endOfLoop

		endOfLoop:
		mov eax, temp
		loop GCDLoop

	L5:
		mWrite"The common divisor is: "
		mov eax, ecx
		call WriteDec

endProgram:
	call Crlf

;call DumpRegs

invoke ExitProcess,0 ;just means return 0, exit_success 	
main endp

;FUNCTION ZONE

ResetRegisters proc
	;reset registers
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

ret
ResetRegisters endp

end main