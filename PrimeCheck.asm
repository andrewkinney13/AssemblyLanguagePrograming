;Name: Andrew Kinney
;Description: Checks if a number is prime or not
;Date: 10.1.2021
;Course: Assembly Language Programming
;Assignment: n/a

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

temp dword 18

.code
main proc ;
	
	call resetRegisters
	call checkPrime



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

checkPrime proc
	
	;figure out whether or not a number is prime
	mov eax, temp
	mov ecx, eax
	dec ecx

	checkDivisibility:
		div ecx
		cmp edx, 0
		je isPrime
		

	isPrime:
		mov eax, 1


ret
checkPrime endp



end main