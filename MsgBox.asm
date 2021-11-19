;Name: Andrew Kinney
;Description: Uses a message box to get user input
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
question byte "Would you like to open the file?"
answer dword ?

.code
main proc
	
	call ResetRegisters
    mov  edx,OFFSET question
	mov  ebx,0                       ; no caption
	call MsgBoxAsk
	mov answer, eax
	cmp  answer,IDYES
	jne  no

	yes:
		mWrite"yes!"
		jmp endProgram

	no:
		mwrite"no!"
		jmp endProgram


	

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

	;mov  eax,white+(green*16)
    ;call SetTextColor

ret
ResetRegisters endp

end main