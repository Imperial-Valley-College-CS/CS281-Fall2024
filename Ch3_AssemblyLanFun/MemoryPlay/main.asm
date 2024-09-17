.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	var1 byte 10h
	var2 byte 20h
	sum byte ?

	dwVar1 dword 1000h
	dwVar2 dword 2000h

.code
	main proc
		; add "var1" and "var2", store sum in "sum"
		mov ah, var1	
		add ah, var2			;add al and ah, and place sum in ah
		mov sum, ah

		; swap "var1" and "var2"
		mov al, var1
		mov ah, var2
		mov var1, ah
		mov var2, al

		; swap "dwVar1" and "dwVar2"
		mov eax, dwVar1
		mov ebx, dwVar2
		mov dwVar1, ebx
		mov dwVar2, eax
		
		INVOKE ExitProcess, 0
	main endp
END main