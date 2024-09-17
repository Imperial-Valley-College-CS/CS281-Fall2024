.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword
	
.data
	arrayB byte 10h, 20h, 30h, 80h		;unsigned integers

.code
	main proc
		
		movzx eax, arrayB
		movzx ebx, [arrayB+1]
		movzx ecx, [arrayB+2]
		movsx edx, [arrayB+3]

		INVOKE ExitProcess, 0
	main endp
END main