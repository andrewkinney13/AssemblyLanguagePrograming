;Name: Andrew Kinney
;Description: Copies the contents of an input file to a new output file
;Date: 10.19.2021
;Course: Assembly Language Programming
;Assignment: Assignment 9

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

BUFFER_SIZE = 50	;global variable!	

.data ;VARIABLE DECLARATIONS

	buffer byte BUFFER_SIZE dup(?)
	filename byte 80 dup(?)
	fileHandleI handle ? ;type is handle, something handler type? idk
	fileHandleO handle ? 

.code
main proc ;
	
	call resetRegisters
	
	;OUTPUT
	;user choses output file name
	mWrite "Enter an output filename: "
	mov edx, offset filename
	mov ecx, sizeof filename
	call ReadString
	
	;create the output file
	mov edx, offset filename
	call CreateOutputFile
	mov fileHandleO, eax

	;INPUT
	;take input file from user
	mWrite "Enter an input filename: "
	mov edx, offset filename
	mov ecx, sizeof filename
	call ReadString
	
	;open input file
	mov edx, offset filename
	call OpenInputFile
	mov fileHandleI, eax

	;read input file
	mov edx, offset buffer
	mov ecx, offset BUFFER_SIZE
	call ReadFromFile
	mov buffer[eax], 0

	;OUTPUT
	;copy contents
	mov eax, fileHandleO
	mov edx, offset buffer
	mov ecx, sizeof buffer
	call WriteToFile

	;CLOSE
	;close the files
	mov eax, fileHandleI
	call CloseFile
	mov eax, fileHandleO
	call CloseFile

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