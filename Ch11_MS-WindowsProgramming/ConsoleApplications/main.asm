include Prototypes.inc

.data
	message byte "Happy Birthday",0dh, 0ah
		byte "To You!",0
	lenMsg = ($-message)
	message2 byte "And Happy Thanksgiving",0dh, 0ah, 0

.code
	main proc
		
		invoke WriteString, addr message
		invoke WriteString, addr message2
		
		INVOKE ExitProcess, 0
	main endp

	WriteString proc,
		ptrString: ptr byte

		.data
			charsWritten dword ?

		.code
		invoke LenStr, ptrString					;returned length of String in EAX
		mov ebx, eax									;move length into EBX

		invoke GetStdHandle, STD_OUTPUT_Handle			;value returned is in EAX
		invoke WriteConsole, eax, ptrString, ebx, addr charsWritten, 0

	ret
	WriteString endp

	LenStr proc,						;returns length of null-terminated String in EAX
		ptrString: ptr byte

		push esi							;preserve esi
		mov eax, 0
		mov esi, ptrString			;move offset of String into ESI
		L1:
			cmp byte ptr [esi], 0	;check of null-termination has been reached
			je done							;jump if reached end of String
			inc eax							;increment counter
			inc esi							;increment offset (to point to next char)
			jmp L1
	done:
		pop esi
		ret
	LenStr endp
		
END main