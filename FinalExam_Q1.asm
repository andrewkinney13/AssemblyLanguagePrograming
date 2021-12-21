;Name: Andrew Kinney
;Description: Multiplies two decimal numbers from user, displays product
;Date: 12.21.2021
;Course: Assembly Language Programming
;Assignment: Final Exam, Problem 1

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

max_len = 100

.data ;VARIABLE DECLARATIONS

.code
main proc ;
	
	call resetRegisters

	mWrite"Enter two decimal numbers to be multiplied: "
	call Crlf
	call Crlf
	mWrite"1): "
	call ReadDec
	mov ebx, eax
	mWrite"2): "
	call ReadDec
	mul ebx
	call Crlf
	mWrite"Product: "
	call WriteDec

endProgram:

	call Crlf 
	call Crlf 

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