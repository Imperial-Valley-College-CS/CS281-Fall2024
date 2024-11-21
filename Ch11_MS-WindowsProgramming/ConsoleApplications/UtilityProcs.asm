include Prototypes.inc

.model flat, stdcall

.code
ReadString proc,
		ptrBuffer: ptr byte

		.data
			charsRead dword ?

		.code
		invoke GetStdHandle, STD_INPUT_Handle			;value returned is in EAX
		invoke ReadConsole, eax, ptrBuffer, MAX_CHARS_TO_READ, addr charsRead, 0

	ret
ReadString endp

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

ReadFromFile proc,
	ptrBuffer:ptr byte,
	ptrFileName:ptr byte


	.code
	INVOKE CreateFile,																;file handle returned in eax
		ptrFileName, GENERIC_READ, DO_NOT_SHARE, NULL,
		OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0 

	;invoke GetLastError

	push eax
	invoke ReadFile,
		eax, ptrBuffer, MAX_CHARS_TO_READ, addr charsRead, NULL
	pop eax
	invoke CloseHandle, eax

	  ret
ReadFromFile endp
end