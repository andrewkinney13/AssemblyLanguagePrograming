;Name: Andrew Kinney
;Description: Prints the sting size of a user's first name
;Date: 11.16.2021
;Course: Assembly Language Programming
;Assignment: Exam II, Question 2

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

buf_size = 50

.data ;VARIABLE DECLARATIONS

myName byte buf_size dup(?)

.code
main proc
	
	call ResetRegisters
	
	mWrite "Enter your first name: "
	mov edx, offset myName
	mov ecx, sizeof myName
	call ReadString
	mWrite"The size of the string that held your name was "
	call WriteDec
	mWrite" bytes"

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