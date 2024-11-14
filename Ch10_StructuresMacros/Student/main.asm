include FunctionPrototypes.inc
include structures.inc

.data
	students Student <"Bo Nix", "809844662", 36, 3.65>, 
		<"Jim C", "809451778", 20, 3.73>,
		<"Bob Ross", "809644511", 17, 3.25>, 
		<"The Rock", "809477135", 19, 3.66>
	lenStudents = ($-students)/(type Student)
	numAdults word ?
	lenNamesArr byte lenStudents DUP(0)

.code
main proc
	
	invoke countAdults, addr students, lenStudents
	mov numAdults, ax

	invoke countNameChars, addr students, lenStudents, addr lenNamesArr


	INVOKE ExitProcess,0
main endp

countAdults proc, ptrArray: ptr Student, lenArr:dword

	mov esi, ptrArray			;offset of first byte in students array
	mov ecx, lenArr			;numbers students in array
	mov eax, 0					;counter for number of adult students
	L1:
		cmp (Student ptr [esi]).age, 18			;compare age to 18
		jge foundAdult
		returnL1:
		add esi, type Student						;add to esi (44 bytes = type Student)
		loop L1
	ret
	foundAdult:
		inc eax
		jmp returnL1	
countAdults endp

countNameChars proc, ptrArray:ptr Student, lenArr:dword, ptrLenNamesArr:ptr byte
	mov esi, ptrArray					;offset of first student
	mov ecx, lenArr					;number of students
	mov edi, ptrLenNamesArr	;offset of empty array for length of 

	L1:
		push esi							;save esi for end of loop
		mov eax, 0						;counter for name length
		L2:
		cmp byte ptr [esi], 0		;reached end of String
		je moveToNextStudent
		cmp byte ptr [esi], 20h		;check if byte is a space (don't count)
		je skipCounter
		inc eax									;increment counter
		skipCounter:
		inc esi									;move to next byte
		jmp L2

	moveToNextStudent:
		mov [edi], eax						;move counter (length of name) to memory
		inc edi									;move to next element in array (lenNamesArr)
		pop esi									;restore esi to point to beginning of student
		add esi, type Student			;add 44 bytes (type Student) to esi (points to next student)
		loop L1									;decrement ecx by 1 and jump in not equal to zero

	ret
countNameChars endp
end