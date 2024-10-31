.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

.code
	main proc
		push 5
		call factorial
		
		INVOKE ExitProcess, 0
	main endp

	factorial proc
		push ebp
		mov ebp, esp

		
		mov ax, [ebp+8]

		pop ebp
		ret
	factorial endp
END main