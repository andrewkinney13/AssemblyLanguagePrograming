;Name: Andrew Kinney
;Description: Changes the text color depending on a user's choice
;Date: 11.30.2021
;Course: Assembly Language Programming
;Assignment: Final Review, Practice Set 1, Problem 4

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

buf_size = 50

.data ;VARIABLE DECLARATIONS

buffer byte buf_size dup(?)
redArray byte "RED",0
greenArray byte "GREEN",0
blueArray byte "BLUE",0

.code
main proc
	
	call ResetRegisters

	mWrite"Enter a color (red, green, or blue): "
	mov edx, offset buffer
	mov ecx, offset buf_size
	call ReadString
	mov buffer[eax], 0
	call Crlf
	
	invoke Str_ucase, addr buffer		;sets the string to all uppercase

	invoke Str_compare, addr buffer, addr redArray
	je isRed
	
	invoke Str_compare, addr buffer, addr greenArray
	je isGreen

	invoke Str_compare, addr buffer, addr blueArray
	je isBlue

	isRed:
		mov  eax,red
		call SetTextColor
		mWrite"The text is now red!"
		jmp endProgram

	isGreen:
		mov  eax,green
		call SetTextColor
		mWrite"The text is now green!"
		jmp endProgram

	isBlue:
		mov  eax,blue
		call SetTextColor
		mWrite"The text is now blue!"
		jmp endProgram

	mWrite"You did not enter a valid color!"

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