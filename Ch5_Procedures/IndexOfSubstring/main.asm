.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	str1 byte "stacking",0
	lenStr1 = ($-str1)
	str2 byte "king",0
	lenStr2 = ($-str2)
	index byte 0


.code
	main proc
		
		mov esi, offset str1
		mov edi, offset str2
		mov ecx, lenStr1-1
		mov edx, lenStr2-1
		call indexOf
		mov index, al

		INVOKE ExitProcess, 0
	main endp

	indexOf proc
		mov eax, 0			;value to be returned
		mov ecx, 5			;need to update using lenStr1 and lenStr2

		jmp L1

		reset:
			pop ecx
			pop edi
			pop esi
			inc esi
			dec ecx
			
		L1:					;loop traverses bigger String
			mov bh, byte ptr [esi]
			mov bl, byte ptr [edi]
			cmp bh, bl
			je foundChars
			inc esi
			inc eax
			loop L1

		;reached end of String1 and String2 is not in String1
		mov eax, -1
		jmp done

		foundChars:
			push esi
			push edi
			push ecx
			mov ecx, edx
			dec ecx			;already compared the first pair of matching characters

			L2:			;loop traverses both String1 and String2 simultaneously
				inc esi
				inc edi
				mov bh, byte ptr [esi]
				mov bl, byte ptr [edi]
				cmp bh, bl
				jne reset
				loop L2

		;reached end of String1 and String2 and never jumped (all characters matched)
		;clean the stack
		pop ecx
		pop edi
		pop esi
		done:
		ret
	indexOf endp
END main