.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword
toUpperCase proto, ptrString: ptr byte

.data
	someStr byte "Toby132**!!",0

.code
	main proc
		;pushad
		invoke toUpperCase, addr someStr
		;popad
		INVOKE ExitProcess, 0
	main endp

	toUpperCase proc, 
		ptrString: ptr byte

		mov esi, ptrString			;move offset of String into ESI

		L1:
			cmp byte ptr [esi], 0
			je reachedEnd
			cmp byte ptr [esi], 61h			;compare byte to "a"
			jge checkLessThanZ
		returnL1:
			inc esi
			jmp L1

		jmp reachedEnd

		checkLessThanZ:
			cmp byte ptr [esi], 7ah			;compare byte to "z"
			jg returnL1
			and byte ptr [esi], 0dfh			;clear bit 6 (at place value 32) 
			jmp returnL1

		reachedEnd:
		ret
	toUpperCase endp

END main