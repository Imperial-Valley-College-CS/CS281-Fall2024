.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	someByte1 byte 10h							;store 34h in memory (use 1 byte)
	someByte2 byte 20h
	someArr byte 10h, 20h, 30h, 40h
	someArr_len = ($-someArr)				;symbolic constant
	monday = 1
	tuesday = 2
	weekDays byte monday, tuesday
	superHero byte "Homelander",0
	sum byte ?

.code
	main proc
		
		mov eax, someArr_len
		mov ebx, 0
		mov al, someByte1 
		mov bl, someByte2
		add al, bl
		mov sum, al

		mov eax, 0
		mov al, superHero
		
		INVOKE ExitProcess, 0
	main endp
END main