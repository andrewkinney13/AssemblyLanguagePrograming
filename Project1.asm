;Name: Andrew Kinney
;Description: Checks whether or not a number is prime, if it is, eax gets 1, if not, 0
;Date: 10.1.2021
;Course: Assembly Language Programming
;Assignment: Project 1

;include Irvine32.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

temp dword 08d

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
	mov ebx, 1
	
	update:
		mov eax, temp	;eax is the dividend, has to be reset every time
		mov ecx, temp	;ecx is the divisor , dec every time
		sub cx, bx	
		inc ebx

	checkEnd:
		cmp ebx, temp	;if not equal keep going 
		je notPrime

	checkDivisibility:
		div cx
		cmp edx, 0		;edx is remainder, if no remaineder, zf is 1
		je isPrime
		jmp update

	isPrime:
		mov eax, 1
		jmp endFunction

	notPrime:
		mov eax, 0
		jmp endFunction

	endFunction:

ret
checkPrime endp



end main
