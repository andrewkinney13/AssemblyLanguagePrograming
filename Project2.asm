;Name: Andrew Kinney
;Description: Adds a list of numbers together from a file entered by the user, list of numbers are seperated by " " spaces
;Date: 10.22.2021
;Course: Assembly Language Programming
;Assignment: Project 2

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
	datasize byte 0
	idx byte 0
	idy byte 0
	res byte 0


.code
main proc ;
	
	call resetRegisters

	;find input file name from user
	mWrite "Enter an input filename: "
	mov edx, offset filename
	mov ecx, sizeof filename
	call ReadString
	
	;open input file
	mov edx, offset filename
	call OpenInputFile
	mov fileHandle, eax

	;read file
	mov edx, offset buffer
	mov ecx, offset BUFFER_SIZE
	call ReadFromFile

	; find out how many bytes is in the file
	mov buffer[eax], 0	;insert null terminator IMPORTANT
	mov datasize, al	;eax is the size of the list in bytes, now it's in datasize
	mWrite "File Size: "
	call WriteDec	;display the file size
	mWrite " bytes"
	call Crlf
	
	;display the buffer, the contents of the file?
	mWrite <"Buffer: ",0dh,0ah,0dh,0ah>	;these are null-terminators for the macro mWrite
	mov edx, offset buffer
	call WriteString
	call Crlf

	;add from file
	
	mov eax, 0
	mov ebx, 0

	scan:
		mov al, datasize		;al is size
		cmp idx, al
		jge printresult			;all the values of the file have been parsed through, jumps out of the loop

		mov al, idx				;eax now holds the current position in the list
		cmp buffer[eax], ' '	;if a space is encountered in the list
		je printdec					;print the number 
		inc idx
		
		jmp scan				;repeats loop

	printdec:
		mov cl, idx	
		mov dl, idy				;idy is the address of first element in the array where a number starts
		call ParseDecimal32		;parsedec automaticall stores decimal version of what it got from buffer into al
		add res, al				;res will hold the sum of all values in the lsit
		
		mov bl, idx
		mov idy, bl
		inc idx 
		jmp scan 

	printresult:
		cmp al, datasize
		cmp idy, al
		jl endbuf
		jmp finalres

	endbuf:
		mov cl, idx
		mov dl, idy
		call ParseDecimal32
		add res, al
		jmp finalres

	finalres: 
		mWrite "Sum: "
		mov eax, 0
		mov al, res
		call WriteDec
		call Crlf

	;close the file
	close_file:
		mov eax, fileHandle
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