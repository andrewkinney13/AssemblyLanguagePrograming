;Name: Andrew Kinney
;Description: Adds all elements of an array that are less than 50
;Date: 11.2.2021
;Course: Assembly Language Programming
;Assignment: n/a

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

buff_size = 50

.data ;VARIABLE DECLARATIONS
	
	array byte 010d, 060d, 020d, 033d, 072d, 089d, 045d, 065d, 072d, 018d

.code
main proc ;
	
	call resetRegisters
	
	mov ecx, sizeof array

	L1:							
		cmp array[ebx], 50
		;mov al, array[ebx]
		;call WriteDec
		;call Crlf
		jle addEmUp
		
		inc ebx
		loop L1

	jmp endProgram

	addEmUp:
		add dl,  array[ebx]
		dec ecx

		cmp ecx, 0
		je endProgram

		inc ebx
		jmp L1
	
	call Crlf

endProgram:

	mov eax, edx
	mWrite "The sum is: "
	call WriteDec
	call Crlf 
	call Crlf



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