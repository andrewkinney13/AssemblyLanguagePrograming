;Name: Andrew Kinney
;Description: Loops 5 times 
;Date: 9.10.2021
;Course: Assembly Language Programming
;Assignment: Assignment 1

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, howmany bits basically
ExitProcess proto,dwExitCode:dword

.data ;under here is where variables are delcared

.code
main proc ;where the code starts, like int main!

	mov	 eax, 5 ;move 5 to the register
	
	zfCheck:
		cmp eax, 0 ;check if eax is 0 are the same
		je endProgram ;jumps to main endp if zf is 1
	
	dec eax ;if zf is not 1, eax is deincremented
	jmp zfCheck ;after eax is deincremented, we go back to the initial cmp

	endProgram:
		invoke ExitProcess,0 ;just means return 0, exit_success 	
		main endp ;just ends the code
		end main