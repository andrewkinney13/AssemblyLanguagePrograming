;Name: Andrew Kinney
;Description: Generates Fibonacci numbers based on user input
;Date: 11.5.2021
;Course: Assembly Language Programming
;Assignment: Assignment 11a

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS
	
n dword 0d

.code
main proc ;
	
	call resetRegisters
	
	;input
	mWrite "Please enter an integer less than or equal to 20, but greater than or equal to 2: "
	call ReadDec
	call Crlf

	;check n is the right size
	cmp eax, 20
	jg errorMsg1
	cmp eax, 2
	jl errorMsg2

	;output
	mWrite "The " 
	call WriteDec
	mWrite " Fibonacci numbers are: "

	;initalize counter
	mov ecx, eax

	;set up first 2 of the sequence
	mov eax, 0
	mov ebx, 1

	;loop
	fibLoop:
		call fibFunc
		loop fibLoop
	jmp endProgram

;errors
errorMsg1:
	mWrite "Number was greater than 20"
	jmp endProgram
	
errorMsg2:
	mWrite "Number was less than 2"
	jmp endProgram

endProgram:
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

fibFunc proc
	call WriteDec
	mWrite " "
	
	add eax, ebx
	xchg eax, ebx

ret
fibFunc endp

end main