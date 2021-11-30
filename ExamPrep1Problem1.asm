;Name: Andrew Kinney
;Description: Converts unsigned number from user to a binary number, prints it
;Date: 11.30.2021
;Course: Assembly Language Programming
;Assignment: Final Review, Practice Set 1, Problem 1

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

	mWrite"Enter a positive number: "
	call ReadDec
	call Crlf

	mWrite"Binary form is: "
	call WriteBin
	

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

Colorful proc
	;sets colors
	mov  eax,black+(green*16)
    call SetTextColor
ret
Colorful endp

end main