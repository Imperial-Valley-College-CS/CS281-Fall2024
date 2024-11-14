include FunctionPrototypes.inc
include structures.inc

.data
	students Student <"Octavio Ortiz", "809844662", 36, 3.65>, 
		<"Olivia Marquez", "809451778", 20, 3.73>,
		<"Stephanie Lopez", "809644511", 17, 3.25>, 
		<"Ivonne Lee", "809477135", 19, 3.66>

	numAdults word ?

.code
main proc
	
	invoke countAdults, addr students, lengthof students
	mov numAdults, ax

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
end