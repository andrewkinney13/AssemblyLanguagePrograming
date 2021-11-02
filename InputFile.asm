;Name: Andrew Kinney
;Description: Will display the contents of a file name entered by the user
;Date: 11.22.2021
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
	filename byte 80 dup(?)
	fileHandle handle ? ;type is handle, something handler type? idk

.code
main proc ;
	
	call resetRegisters

	;take input file from user
	mWrite "Enter an input filename: "
	mov edx, offset filename
	mov ecx, sizeof filename
	call ReadString
	
	;open file
	mov edx, offset filename
	call OpenInputFile
	mov fileHandle, eax

	;check error opeing
	cmp eax, INVALID_HANDLE_VALUE
	je error
	jmp read_file
	error:
		mWrite "Error opening file"

	;read file
	read_file:
		mov edx, offset buffer
		mov ecx, offset BUFFER_SIZE
		call ReadFromFile
		jnc	check_buffer_size ;means jumps if carry flag equals zero 
		mWrite "Error reading file"
		call WriteWindowsMsg ;see the error?
		jmp close_file   ;error -closefile

	;check the buffer is big enough
	check_buffer_size:
		cmp eax, BUFFER_SIZE ;is the buffer big enough?
		jb buf_size_ok		 ;buffer size is bigger so, CF = 1
		mWrite "Error with the buffer"
		jmp endProgram

	;if it's the right size, find out how many bytes is in the file
	buf_size_ok:
		mov buffer[eax], 0	;insert null terminator
		mWrite "File Size: "
		call WriteDec	;display the file size
		mWrite " bytes"
		call Crlf
	
	;display the buffer, the contents of the file
	mWrite "Buffer contains: "
	mov edx, offset buffer
	call WriteString
	call Crlf

	;close the file
	close_file:
		mov eax, fileHandle
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
