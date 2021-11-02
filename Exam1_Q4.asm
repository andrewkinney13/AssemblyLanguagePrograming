;Name: Andrew Kinney
;Description: Processes an array, finds the largest item in the array
;Date: 9.28.2021
;Course: Assembly Language Programming
;Assignment: Exam 1 Question 4

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

array byte 01d, 010d, 04d, 07d, 011d

.code
main proc ;
	
	call resetRegisters

	mov ecx, 5

	L1:						;runs five times, for each item in array
		mov bl, array[edx] 
		cmp bl, al
		jg newMax
		call update
		cmp ecx, 0
		je endProgram
		jmp L1


	newMax:					;runs if current item in array is greater than current max item
		mov al, bl
		call update
		cmp ecx, 0
		je endProgram
		jmp L1
	
endProgram:
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

update proc
	;both L1 and newMax loops do these instructions, so to reduce redundancy i used a function :D
	inc edx
	dec ecx
	
ret
update endp




end main