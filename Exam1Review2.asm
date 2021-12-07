;Name: Andrew Kinney
;Description: Uses a structure to store the values of string and decimal variables, outputs the
;Date: 12.7.2021
;Course: Assembly Language Programming
;Assignment: Final Review, Practice Set 2, Problem 2

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

max_len = 50

;prototype?
employee struct
		lastName byte max_len DUP(?)
		salary byte 12 DUP(?)
		age byte 3 DUP(?)
	employee ends	;end structutre

.data ;VARIABLE DECLARATIONS

	e employee<>

.code
main proc ;
	
	call resetRegisters

	;move to class
	mWrite "Enter the employee's last name: "
	mov ecx, max_len
	mov edx, offset e.lastName
	call ReadString

	mWrite "Enter their salary: "
	mov ecx, 12
	mov edx, offset e.salary
	Call ReadString

	mWrite "Enter their age: "
	mov ecx, 3
	mov edx, offset e.age
	Call ReadString
	call Crlf
	

	;output for verification
	mWrite "The employee's last name is: "
	mov ecx, max_len 
	mov edx, offset e.lastName
	call WriteString
	call Crlf

	mWrite"Their salary is: "
	mov ecx, 12
	mov edx, offset e.salary
	call WriteString
	call Crlf
	
	mWrite"Their age is: "
	mov ecx,2 
	mov edx, offset e.age
	call WriteString
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