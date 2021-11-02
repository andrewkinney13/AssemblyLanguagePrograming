;Name: Andrew Kinney
;Description: Uses a structure to store the values of string and byte variables 
;Date: 10.22.2021
;Course: Assembly Language Programming
;Assignment: Assignment 10

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

max_len = 10

;prototype?
student struct	;struct, like a class! (structure, it's a keyword)
		myName byte max_len DUP(?)
		grade byte 2 DUP(?)
	student ends	;end structutre

.data ;VARIABLE DECLARATIONS

	s student<>

.code
main proc ;
	
	call resetRegisters

	;move to class
	mWrite "Enter the student's name: "
	mov ecx, max_len
	mov edx, offset s.myName
	call ReadString

	mWrite "Enter the grade: "
	mov ecx, 2
	mov edx, offset s.grade
	Call ReadString
	call Crlf
	

	;output for verification
	mov ecx, max_len 
	mov edx, offset s.myName
	call WriteString

	mWrite "'s grade is: "

	mov ecx, 2
	mov edx, offset s.grade
	call WriteString
	
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