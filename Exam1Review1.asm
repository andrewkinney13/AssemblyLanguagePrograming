;Name: Andrew Kinney
;Description: Uses a structure to store x and y data members inputted by the user,
			  uses those points to position the cursor on the console window ini that location
;Date: 12.7.2021
;Course: Assembly Language Programming
;Assignment: Final Review, Practice Set 2, Problem 1

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

;prototypes
point struct
		x dword ?
		y dword ?
	point ends	;end structutre

.data ;VARIABLE DECLARATIONS

	p point <0,0>

.code
main proc 

	call resetRegisters

	mWrite"Enter the X: "
	call ReadDec
	mov p.x, eax

	mWrite"Enter the Y: "
	call ReadDec
	mov p.y, eax

	call GetMaxXY
	mov eax, p.x
	mov dl, al			;column
	mov eax, p.y		;row
	mov dh, al         
	call Gotoxy		    ;to position the cursor
	mWrite"CURSOR HERE!"

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