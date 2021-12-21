;Name: Andrew Kinney
;Description: Checks if a three digit number is a palindrome 
;Date: 12.21.2021
;Course: Assembly Language Programming
;Assignment: Final Exam, Problem 3

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

max_len = 100

.data ;VARIABLE DECLARATIONS

ten dword 10

.code
main proc ;
	
	call resetRegisters

	mWrite"Enter a three-digit number: "
	call ReadDec

	mov ebx, eax

	;ecx has first digit
	div ten
	mov ecx, edx
	mov edx, 0
	div ten

	;eax has first digit, ecx has third, middle digit is irrelevent
	cmp eax, ecx
	je Palindrome
	jmp notPalindrome

	call Crlf
	call Crlf

	Palindrome:
		mov eax, ebx
		call WriteDec
		mWrite" is a Palindrome!"
		jmp endProgram

	notPalindrome:
		mov eax, ebx
		call Writedec
		mWrite" is not a Palindrome..."


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