;Name: Andrew Kinney
;Description: Uses pointers to swap the values of two variables
;Date: 9.17.2021
;Course: Assembly Language Programming
;Assignment: Assignment 4

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;under here is where variables are delcared

A dword 05d
B dword 06d
temp dword 0d

.code
main proc ;where the code starts, like int main!
	
	swap:
		mov ecx, A					;temp = A
		mov temp, ecx			

		mov esi, offset temp    	;memory location of temp

		mov ecx, B					;A = B
		mov A, ecx		

		mov ecx, [esi]				;B = dereferenced memory location of temp (A)
		mov B, ecx		

	verify:
		mov eax, A
		mov ebx, B

	endProgram:
		invoke ExitProcess,0 ;just means return 0, exit_success 	
		main endp ;just ends the code
		end main