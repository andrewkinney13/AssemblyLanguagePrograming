;Name: Andrew Kinney
;Description: Swaps all of the values of two arrays
;Date: 9.24.2021
;Course: Assembly Language Programming
;Assignment: n/a

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

A byte 01d, 02d, 03d, 04d, 05d
B byte 06d, 07d, 08d, 09d, 010d

.code
main proc ;
	
	mov eax, 0
	mov ebx, 0
	mov ecx, 5
	mov edx, 0

	L1:
		mov al, A[edx]
		mov bl, B[edx]
		mov B[edx], al
		mov A[edx], bl
		inc edx
		loop L1

	mov eax, 0
	mov ebx, 0
	mov ecx, 5
	mov edx, 0

	L2:
		mov al, A[edx]
		mov bl, B[edx]
		inc edx
		loop L2


endProgram:
invoke ExitProcess,0 ;just means return 0, exit_success 	
main endp

;FUNCTION ZONE




end main