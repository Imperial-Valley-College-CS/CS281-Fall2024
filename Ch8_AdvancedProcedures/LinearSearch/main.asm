.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword
linSearch proto, ptrArr:ptr word, someVal:dword, lenArr: dword

.data
	arr word 34, 18, -2, 4, 22, 9, 33, 8
	val word 100
	index byte ?

.code
	main proc
		
		invoke linSearch, addr arr, val, lengthof arr
		mov index, al								;index of element is returned in AL
		
		INVOKE ExitProcess, 0
	main endp

	linSearch proc, 
		ptrArr:ptr word, 
		someVal:dword, 
		lenArr: dword

		mov esi, ptrArr				;move offset of array into esi
		mov ebx, someVal			;value to look for in BX
		mov ecx, lenArr			;move length of array into loop counter (ECX)

		mov eax, -1					;return register (-1 by default)
		mov edx, 0					;index value of current element
		
		L1:
			cmp word ptr [esi], bx
			je foundElem
			add esi, type word			;add two to esi (offset of arr)
			inc edx								;increment index value
			loop L1
		
		jmp reachedEnd					;jump over foundElem label when loop is done
		
		foundElem:
			mov eax, edx					;move current index into return register
		reachedEnd:
			ret
	linSearch endp

END main