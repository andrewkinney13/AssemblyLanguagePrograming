;Name: Andrew Kinney
;Description: Swaps each element of an array with the next element
;Date: 9.14.2021
;Course: Assembly Language Programming
;Assignment: Assignment 3

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, howmany bits basically
ExitProcess proto,dwExitCode:dword

.data ;under here is where variables are delcared

array byte 1d, 2d, 3d, 4d, 5d, 6d

.code
main proc ;where the code starts, like int main!
	
	mov eax, 0
	mov ebx, 0
	mov ecx, 5
	mov edx, 0


	swap:			
		mov al, array[edx]
		mov bl, array[edx+1]
		xchg al, bl
		mov array[edx], al
		mov array[edx+1], bl
		inc edx
		
		cmp ecx, 0
		je resetRegisters
		loop swap
	
	resetRegisters:
		mov ecx, 6
		mov edx, 0

	realize:
		
		mov al, array[edx]
		inc edx

		cmp ecx, 0
		je endProgram
		loop realize

	endProgram:
		invoke ExitProcess,0 ;just means return 0, exit_success 	
		main endp ;just ends the code
		end main