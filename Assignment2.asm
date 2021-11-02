;Name: Andrew Kinney
;Description: Adds up an array in eax
;Date: 9.10.2021
;Course: Assembly Language Programming
;Assignment: Assignment 2

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, howmany bits basically
ExitProcess proto,dwExitCode:dword

.data ;under here is where variables are delcared

;creates array
array byte 10d, 12d, 13d, 14d

.code
main proc ;where the code starts, like int main!

;assign values to registers
	mov eax, 0
	mov ebx, 0
	mov ecx, 4

	L1:
		add al, [array+ebx] ;adds 0-4 of array to al, or eax, as ebx inc every loop
		inc ebx 
		loop L1 ;--ecx every loop, runs 4 times

	endProgram:
		invoke ExitProcess,0 ;just means return 0, exit_success 	
		main endp ;just ends the code
		end main