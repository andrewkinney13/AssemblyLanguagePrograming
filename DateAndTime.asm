;Name: Andrew Kinney
;Description: Print the amount of nanoseconds since January 1, 1601
;Date: 11.19.2021
;Course: Assembly Language Programming
;Assignment: N/A

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

filetime struct
	loDateTime dword ?
	hiDateTime dword ?
filetime ends

.data ;VARIABLE DECLARATIONS
	dateTime filetime<>

	a dword ?

.code
main proc
	
	call ResetRegisters
	
	invoke GetDateTime, ADDR dateTime

	;print the time
	mov eax, datetime.hiDateTime
	call WriteDec
	mov eax, datetime.DateTime
	call WriteDec


	

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