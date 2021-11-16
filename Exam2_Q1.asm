;Name: Andrew Kinney
;Description: Prints the sum of 5 entered integers from the user
;Date: 11.16.2021
;Course: Assembly Language Programming
;Assignment: Exam II, Question 1

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS



.code
main proc
	
	call ResetRegisters

	mWrite"Please enter five integers: "
	mov ecx, 5
	call Crlf
	L1:
		call ReadDec
		add ebx, eax
		loop L1
	call Crlf
	mWrite"The sum is: "
	mov eax, ebx
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