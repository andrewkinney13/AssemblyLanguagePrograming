;Name: Andrew Kinney
;Description: Create a better RandomRange function, allows any range of numbers, even negative 
;Date: 11.9.2021
;Course: Assembly Language Programming
;Assignment: Assignment 11b

include Irvine32.inc
include macros.inc
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS
.model flat,stdcall
.stack 4096 ;4KB, how many bits basically
ExitProcess proto,dwExitCode:dword

.data ;VARIABLE DECLARATIONS

.code
main proc ;
	
	call ResetRegisters
    mov eax, -300
    mov ebx, 100
    mov ecx, 50

	mWrite "The random numbers are..."
	call Crlf

    printRandomNums:
        push eax            
        push ebx

        call BetterRandomRange

        pop ebx
        pop eax

		loop printRandomNums

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

BetterRandomRange PROC
	sub ebx, eax        
	xchg ebx, eax       
	call RandomRange    
	neg ebx              
	sub eax, ebx        
	call WriteInt      
	call Crlf
ret
BetterRandomRange ENDP

end main