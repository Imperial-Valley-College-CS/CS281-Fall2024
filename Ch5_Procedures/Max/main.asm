.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	num1 dword 1000
	num2 dword 36
	num3 dword 3478
	biggest dword ?

.code
	main proc
		
		mov eax, num1
		mov ebx, num2
		call max					;biggest of num1 and num2 is returned in eax

		mov ebx, num3
		call max
		mov biggest, eax

		INVOKE ExitProcess, 0
	main endp

	;max - returns the biggest of dword elements
	;Receives: eax, ebx - both dword elements
	;Returns: eax - biggest of two dword elements
	max proc
		
		cmp eax, ebx			; eax < ebx jump to L1
		jl L1
			ret						;return if eax > ebx
		L1:
			mov eax, ebx
		ret
	max endp
END main