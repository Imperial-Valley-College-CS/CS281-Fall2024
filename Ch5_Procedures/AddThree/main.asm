.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	num1 word 5
	num2 word 2
	num3 word 1
	sum word ?

.code
	main proc

		push eax					;save value in eax on stack
		push ebx					;save value in ebx on stack
		push ecx					;preserve ecx

		movzx eax, num1
		movzx ebx, num2
		movzx ecx, num3
		call addThree
		mov sum, ax

		pop ecx				;restore ecx
		pop ebx			;restore ebx
		pop eax				;restore eax

		INVOKE ExitProcess, 0
	main endp

	;addThree - adds three word elements and returns sum
	;Receives: eax, ebx, ecx - all a word each
	;Returns: eax - sum of three word elements
	addThree proc
		add eax, ebx
		add eax, ecx
		ret
	addThree endP

END main