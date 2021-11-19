;Name: Andrew Kinney
;Description: Move the cursor to a particular position on the console window
;Date: 11.19.2021
;Course: Assembly Language Programming
;Assignment: N/A

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

.code
main proc
	
	call ResetRegisters
	
	call GetMaxXY
	mov dl, 20         ;highest column number = X-1
	mov dh, 5         ;highest row number = Y-1

	call Gotoxy     ;to position the cursor
	mWrite"AHHH!"
	;call Gotoxy     ;to position the cursor
    


	

endProgram:
	call Crlf

;call DumpRegs

invoke ExitProcess,0 ;just means return 0, exit_success 	
main endp

;FUNCTION ZONE

ResetRegisters proc
	;reset registers
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

ret
ResetRegisters endp

end main