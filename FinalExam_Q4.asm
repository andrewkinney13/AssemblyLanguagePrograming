;Name: Andrew Kinney
;Description: Counts the occurence of numbers a user enters 
;Date: 12.21.2021
;Course: Assembly Language Programming
;Assignment: Final Exam, Problem 4

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

max_len = 100

.data ;VARIABLE DECLARATIONS

array byte max_len dup(?)
newArray byte max_len dup(?)

.code
main proc ;
	
	call resetRegisters
	mov ecx, 100

	mWrite"Enter the integers between 1-100, up to 100 entries (0 to end input): "
	call Crlf
	call Crlf

	entryLoop:
		call ReadDec
		mov array[ebx], al
		cmp eax, 0
		je compute
		inc ebx
		loop entryLoop
	
	;ebx has total elements
	compute:
		mov ecx, ebx
		mov ebx, 0
		mov eax, 0
			count:
				mov dl, array[eax]
				mov bl, newArray[edx]		;newArray contains 100 ints, at a given element, 
				inc ebx						;the number it holds is the occurences of that number in array
				mov newArray[edx], bl
				inc eax
				loop count

		mov edx, 0
		mov ecx, 100
		call Crlf
		
		display:
			mov al, newArray[edx]
			cmp eax, 0
			je later

			mov eax, edx
			call WriteDec
			mWrite" occurs "
			mov al, newArray[edx]
			cmp eax, 1
			je singular
			jmp multiple

			singular:
				call WriteDec
				mWrite" time"
				call Crlf
				jmp later

			multiple:
				call WriteDec
				mWrite" times"
				call Crlf

			

			later:
				inc edx
				loop display
		
			


		

endProgram:

	call Crlf 
	call Crlf 

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