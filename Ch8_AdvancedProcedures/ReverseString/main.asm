.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	slang byte "what the sigma",0
	lenStr = ($-slang)-1
	revSlang byte lenStr DUP(0),0

.code
	main proc
		push offset slang				;passing args by reference through stack
		push offset revSlang		;passing args by referece through stack
		call reverseString
		INVOKE ExitProcess, 0
	main endp

	reverseString proc
		push ebp					;preserve EBP register
		mov ebp, esp				;copy stack pointer (ESP) into base stack pointer (EBP)
		mov esi, [ebp+12]		;offset of first String into esi
		mov edi, [ebp+8]		;offset of second String into edi
		
		mov ecx, 0				;zero-out loop counter

		L1:
			cmp byte ptr [esi], 0		;check if null has been reached
			je reachedNull					;jump if reached null
			inc ecx								;increment loop counter
			inc esi								;increment esi
			jmp L1

		reachedNull:
			dec esi				;esi reached null, move it back to last character

		L2:
			mov al, [esi]			;grabbing "last" character from first String
			mov [edi], al			;storing into first byte from second String
			inc edi					;increment offset of second String for next character
			dec esi					;decrement offset of first String
			loop L2

		pop ebp						;restore ebp
		ret 8						;clear arguments off stack (2 dwords)
	reverseString endp
END main