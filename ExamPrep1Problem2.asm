;Name: Andrew Kinney
;Description: Outputs the user's name to a file
;Date: 11.30.2021
;Course: Assembly Language Programming
;Assignment: Final Review, Practice Set 1, Problem 2

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

buf_size = 50

.data ;VARIABLE DECLARATIONS

nameString byte buf_size dup(?)
filename byte "yourName.txt",0
fileHandle handle ?

.code
main proc
	
	call ResetRegisters

	;input
	mWrite"Enter your name: "
	mov edx, offset nameString
	mov ecx, sizeof nameString
	call ReadString
	mov nameString[eax], 0

	;create file
	mov edx, offset filename
	call CreateOutputFile
	mov fileHandle, eax

	;write to it
	mov edx, offset nameString
	mov ecx, sizeof nameString
	call WriteToFile

	mov eax, fileHandle
	mov ebx, edx
	call CloseFile

	call Crlf
	
	mWrite"Check file: yourName.txt"


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