.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

Student struct
	name byte 30 DUP(0)
	gNum byte 10 DUP(0)
	age byte ?
	gradeLevel byte 10 DUP(0)
	gpa real4 0.0
Student ends

.data
	joe Student <"John Doe", , 23>

.code
	main proc
		
		INVOKE ExitProcess, 0
	main endp
END main