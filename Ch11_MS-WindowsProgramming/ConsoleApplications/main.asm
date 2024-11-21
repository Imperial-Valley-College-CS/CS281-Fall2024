include Prototypes.inc

.data
	message byte "Happy Birthday",0dh, 0ah
		byte "To You!",0
	lenMsg = ($-message)
	message2 byte "And Happy Thanksgiving",0dh, 0ah, 0
	buffer byte MAX_CHARS_TO_READ DUP(0)
	file byte "Roster.txt",0
	someStr byte 36h, 32h, 0
	age byte ?
	ageStr byte 3 DUP(0)

.code
	main proc
		
		;invoke ReadString, addr buffer
		;invoke WriteString, addr buffer
		;invoke ReadFromFile, addr buffer, addr file												;user-defined
		invoke parseInt, offset someStr					;integer value returned in eax
		mov age, al													;move return value (low byte) to memory
		invoke WriteInt, age									;integer to write to console

		
		INVOKE ExitProcess, 0
	main endp

	parseInt proc,
		ptrString: ptr byte

		push esi
		push ebx
		mov esi, ptrString

		mov eax, 10						;multiplicand
		mov bl, byte ptr [esi]		;grab first byte at offset
		sub bl, 30h						;from ascii table "1" = 31h
		mul bl								;multiply first digit times 10 (answer in ax)

		inc esi								;point to next byte
		mov bl, byte ptr [esi]		;grab second byte at offset
		sub bl, 30h						;convert encoded value to actual integer value

		add al, bl							;add the "two" digits

		pop ebx
		pop esi
		ret
	parseInt endp
	

	writeInt proc,
		nVal:dword

		.data
			strVal byte 3 DUP(0)

		.code
		push ebx
		mov ebx, 10				;move divisor into ebx

		div bl						;divides eax, by 10 (AL=Quotient, AH=Remainder)

		add al, 30h							;encode integer for printing
		mov byte ptr [strVal], al		;move byte to memory
		add ah, 30h
		mov byte ptr [strVal+1], ah	;move second byte to memory

		invoke WriteString, addr strVal		;write value to console
		pop ebx
		ret
	writeInt endp
	

END main