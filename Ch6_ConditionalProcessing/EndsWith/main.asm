.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	str1 byte "men",0
	str2 byte "batman",0
	flag byte 1				;initially true (str1 ends with str2)

.code
	main proc
		
		mov esi, offset str1
		mov edi, offset str2
		call endsWith
		mov flag, al				;value is returned in eax

		INVOKE ExitProcess, 0
	main endp

	endsWith proc
		
		push esi				;preserve offset of Str1 (esi is modified by stringLen)
		call stringLen
		mov ecx, eax			;move length of Str1 into ecx
		mov esi, edi			;move offset of Str2 into esi (stringLen needs offset in esi)
		call stringLen
		mov edx, eax		;move length of Str2 into edx
		pop esi					;restore offset of Str1

		add esi, ecx			;point to last character in Str1
		dec esi

		add edi, edx			;point to last character in Str2
		dec edi

		cmp edx, ecx
		jl chooseStr2
		jmp traverseStrings

		chooseStr2:
			mov ecx, edx		;choose smaller String (determines number of loops)

		traverseStrings:
			mov bh, [esi]			;move character from Str1
			mov bl, [edi]			;move character from Str2
			cmp bh, bl				
			jne foundMismatch		;jump if characters aren't the same
			dec esi							;move back to previous character in Str1
			dec edi							;move back to previous character in Str2
			loop traverseStrings

		mov eax, 1						;reached end of loop (didn't find mismatch), return true
		ret

		foundMismatch:
			mov eax, 0				;mismatch was found, return false
			ret
	endsWith endp

	;Receives: esi - offset of String
	;Returns: eax - length of String
	stringLen proc

		mov eax, 0
		L1:
			cmp byte ptr [esi], 0
			je reachedEnd
			inc esi
			inc eax
			jmp L1
		
		reachedEnd:
			ret
	stringLen endp
END main