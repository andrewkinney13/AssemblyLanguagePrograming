;Name: Andrew Kinney
;Description: Writes whatever is in "newbuffer" to a file entered by the user
;Date: 10.19.2021
;Course: Assembly Language Programming
;Assignment: n/a

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

BUFFER_SIZE = 50	;global variable!	

.data ;VARIABLE DECLARATIONS

	buffer byte BUFFER_SIZE dup(?)
	newbuffer byte "Hello World",0
	filename byte 80 dup(?)
	fileHandle handle ? ;type is handle, something handler type? idk

.code
main proc ;
	
	call resetRegisters

	;take file name from user
	mWrite "Enter an output filename: "
	mov edx, offset filename
	mov ecx, sizeof filename
	call ReadString
	
	;open the file
	mov edx, offset filename
	call CreateOutputFile
	mov fileHandle, eax

	;Write to the file
	;mov eax, fileHandle
	mov edx, offset newbuffer
	mov ecx, sizeof newbuffer
	call WriteToFile
	jmp close_file

	;close the file
	close_file:
		mov eax, fileHandle
		mov ebx, edx
		call CloseFile

	call Crlf
	call Crlf

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
