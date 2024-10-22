.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data


.code
	main proc
		mov eax, 0
		mov al, 4
		shl eax, 2
		
		INVOKE ExitProcess, 0
	main endp
END main