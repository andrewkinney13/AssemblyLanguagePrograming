;Name: Andrew Kinney
;Description: Finds out how many digits are in a number entered by the user
;Date: 10.8.2021
;Course: Assembly Language Programming
;Assignment: Assignment 7

; The main assembley code file!
include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

prompt byte "Enter a decimal number: ",0
msg byte "Your number had this many digits: ",0
ten dword 10

.code
main proc ;
	
	call resetRegisters

	mov edx, offset prompt
	call ReadString
	call WriteString

	call ReadDec		;dec in eax

	mov edx, 0			;clear for division

	L1:
		div ten
		mov edx, 0
		inc ebx
		cmp eax, 0
		je L2
		jmp L1

	L2:
		mov edx, offset msg
		call WriteString

		mov eax, ebx
		call WriteDec

endProgram:

;call DumpRegs

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
