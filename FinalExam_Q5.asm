;Name: Andrew Kinney
;Description: Displays the distinct numbers a user enters
;Date: 12.21.2021
;Course: Assembly Language Programming
;Assignment: Final Exam, Problem 5

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

max_len = 10

.data ;VARIABLE DECLARATIONS

array byte max_len dup(?)
newArray byte max_len dup(?)
tempECX dword ?
tempEDX dword ?
finalEDX dword ?

.code
main proc ;
	
	call resetRegisters

	mWrite"Enter 10 numbers: "
	call Crlf
	call Crlf

	mov ecx, 10

	entryLoop:
		call ReadDec
		mov array[ebx], al
		inc ebx
		loop entryLoop

	mov eax, 0
	mov ecx, 10

	distinct:
		mov bl, array[eax]
	

		mov tempECX, ecx
		mov ecx, 10
		mov edx, 0
		compare:
			cmp bl, newArray[edx]
			je alreadyThere
			inc edx
			loop compare

		;if were here, the num is distinct
		mov edx, tempEDX
		mov newArray[edx], bl
		inc edx
		mov finalEDX, edx
		mov tempEDX, edx

		alreadyThere:
			
		mov ecx, tempECX
		inc eax
		loop distinct

	display:
		mWrite"The distinct numbers are: "
		mov ecx, finalEDX
		mov ebx, 0
		call Crlf

		output:
			mov al, newArray[ebx]
			call WriteDec
			mWrite " "
			inc ebx
			loop output
		
			

		

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