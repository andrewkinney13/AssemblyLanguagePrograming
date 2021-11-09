;Name: Andrew Kinney
;Description: Reverse an array, of any size, with random integer elements, without making a copy of it
;Date: 11.9.2021
;Course: Assembly Language Programming
;Assignment: Assignment 12

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

max_size = 100

.data ;VARIABLE DECLARATIONS
	
array byte max_size dup(?)
mySize dword 10
two dword 2
pivot dword ?

.code
main proc ;
	
	call ResetRegisters

	;populate array with random numbers
	mWrite "Initial array is: "
	call Randomize
	populate:
		mov eax, 101
		call RandomRange
		mov array[ebx], al
		inc ebx

		mov al, array[ebx-1]
		call WriteDec
		mWrite" "

		cmp ebx, mySize
		je oddOrEven
		jmp populate

	;check if it's odd or even
	oddOrEven:
		call Crlf
		call ResetRegisters
		mov eax, mySize
		dec eax
		div two
		cmp edx, 0
		je evenSize
		jmp oddSize

	;loop for swapping an even array
	evenSize:
		;mWrite "EVEN!"
		call ResetRegisters
		call Crlf

		;assign pivot
		mov eax, mySize
		div two
		mov pivot, eax

		;ebx is idx ecx is idy
		call ResetRegisters
		mov ecx, mySize
		dec ecx
		mov ebx, 0
		swap1:
			mov al, array[ebx]
			mov dl, array[ecx]
			xchg al, dl
			mov array[ebx], al
			mov array[ecx], dl

			;while idx < pivot
			cmp ebx, pivot
			je display
			
			inc ebx
			dec ecx
			jmp swap1

	;loop for swapping an odd array
	oddSize:
		call ResetRegisters
		call Crlf

		;ebx is idx ecx is idy
		call ResetRegisters
		mov ecx, mySize
		dec ecx
		mov ebx, 0
		swap2:
			mov al, array[ebx]
			mov dl, array[ecx]
			xchg al, dl
			mov array[ebx], al
			mov array[ecx], dl

			inc ebx
			dec ecx

			;while idx < idy, check after incrementing!
			cmp ebx, ecx
			jg display
			jmp swap2

display:
	call ResetRegisters
	mWrite "The reversed array is: "

	displayLoop:
		mov al, array[ebx]
		call WriteDec
		mWrite" "
		inc ebx 
		cmp ebx, mySize
		je endProgram
		jmp displayLoop

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