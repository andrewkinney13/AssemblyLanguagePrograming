;Name: Andrew Kinney
;Description: Uses a structure to store x and y data members
;Date: 10.22.2021
;Course: Assembly Language Programming
;Assignment: n/a

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

;prototype?
point struct	;struct, like a class! (structure, it's a keyword)
		x dword ?
		y dword ?
	point ends	;end structutre

.data ;VARIABLE DECLARATIONS

	p point <0,0>

.code
main proc ;
	
	call resetRegisters

	mov p.x, 1
	mov p.y, 2
	mov eax, p.x
	mWrite "X axis: "
	call WriteDec
	call Crlf
	mov eax, p.y
	mWrite "y axis: "
	call WriteDec

	call Crlf
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