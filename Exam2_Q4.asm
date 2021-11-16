;Name: Andrew Kinney
;Description: Determines whether a number entered by the user is odd or even
;Date: 11.16.2021
;Course: Assembly Language Programming
;Assignment: Exam II, Question 4

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

two dword 2

.code
main proc
	
	call ResetRegisters
	
	mWrite"Please enter a number: "
	call ReadDec
	call Crlf
	div two
	cmp edx, 0
	je evenNum
	jmp oddNum
		
	evenNum:
		mWrite"EVEN"
		jmp endProgram
	oddNum:
		mWrite"ODD"
		jmp endProgram

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