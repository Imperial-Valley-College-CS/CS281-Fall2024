include FunctionPrototypes.inc
include structures.inc

.data
	students Student <"Octavio Ortiz", "809844662", 36, 3.65>, <"Olivia Marquez", "809451778", 20, 3.73>,
		<"Stephanie Lopez", "809644511", 17, 3.25>, <"Ivonne Lee", "809477135", 19, 3.66>
	

.code
main proc
	
	mov ecx, lengthof students
	mov esi, offset students

	L1:
		mov al, (Student ptr [esi]).age
		add esi, type Student
		loop L1

	INVOKE ExitProcess,0
main endp
end