.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	rows byte 4
	cols byte 3
	arr word 1011h, 2022h, 3033h
		  word 4044h, 5055h, 6066h
		  word 7077h, 8088h, 9099h
		  word 1234h, 5678h, 1234h
	count byte 0

.code
	main proc
		
		mov esi, offset arr		;offset of first element in arr
		movzx ecx, rows

		outerLoop:
			mov count, cl			;save ecx (loop counter) to memory
			movzx ecx, cols			;initialize ecx to number of iterations for inner loop
			innerLoop:
				movzx eax, word ptr [esi]			;grab a word worth of data from memory (esi)
				add esi, type word
				loop innerLoop
			movzx ecx, count		;restore ecx for outer loop
			loop outerLoop

		INVOKE ExitProcess, 0
	main endp
END main