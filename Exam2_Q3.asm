;Name: Andrew Kinney
;Description: Prints the max integer of an array entered by the user
;Date: 11.16.2021
;Course: Assembly Language Programming
;Assignment: Exam II, Question 3

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

buf_size = 5

.data ;VARIABLE DECLARATIONS

myArray byte buf_size dup(?)

.code
main proc
	
	call ResetRegisters
	
	;store into array
	mWrite"Please enter five integers: "
	mov ecx, buf_size
	call Crlf
	L1:
		call ReadDec
		mov myArray[ebx], al
		inc ebx
		loop L1

	;find max, edx holds current max
	mov ebx, 0
	mov dl, myArray[ebx]
	inc ebx
	mov ecx, buf_size-1
	L2:
		cmp dl, myArray[ebx]
		jl L3
		inc ebx
		loop L2
	
	;once L2 runs through all values jump to end
	jmp endProgram

	;make edx new max
	L3:
		mov dl, myArray[ebx]
		dec ecx
		inc ebx
		jmp L2
		

endProgram:
	call Crlf
	mWrite"The max value was "
	mov eax, edx
	call WriteDec
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