;Name: Andrew Kinney
;Description: Finds the user's name from an input file, prints it to console
;Date: 11.30.2021
;Course: Assembly Language Programming
;Assignment: Final Review, Practice Set 1, Problem 3

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

buf_size = 50

.data ;VARIABLE DECLARATIONS

nameString byte buf_size dup(?)
filename byte "findName.txt",0
fileHandle handle ? ;type is handle, something handler type? idk

.code
main proc
	
	call ResetRegisters

	;open file
	mov edx, offset filename
	call OpenInputFile
	mov fileHandle, eax
	
	;read from file
	mov edx, offset nameString
	mov ecx, offset buf_size
	call ReadFromFile

	;display
	mWrite "Name in file: "
	mov edx, offset nameString
	call WriteString
	call Crlf

	;close the file
	mov eax, fileHandle
	call CloseFile

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