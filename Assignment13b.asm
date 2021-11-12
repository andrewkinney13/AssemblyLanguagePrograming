;Name: Andrew Kinney
;Description: Converts an int of 4-bytes into a string of ASCII decimal digits, displays it 
;Date: 11.12.2021
;Course: Assembly Language Programming
;Assignment: Assignment 13b

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

buf_size = 10

.data ;VARIABLE DECLARATIONS

N dword ?
R dword ?
index dword 0
buffer byte buf_size DUP(?)
ten dword 10

.code
main proc
	
	call ResetRegisters

	mWrite "Enter a integer: "
	call ReadDec
	mov N, eax

	mov ebx, buf_size - 1
	convertToString:
		mov edx, 0
		mov eax, N
		div ten
		mov R, edx
		mov N, eax
		mov buffer[ebx], dl
		dec ebx
		inc index
		cmp N, 0
		jg convertToString

	mov ebx, buf_size
	sub ebx, index
	mov ecx, index

	mWrite "String: "
	display:
		mov al, buffer[ebx]
		inc ebx
		call WriteDec
		loop display

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

end main