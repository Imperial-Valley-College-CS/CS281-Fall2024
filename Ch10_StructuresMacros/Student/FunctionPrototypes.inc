.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:DWORD
countAdults proto, ptrArray: ptr Student, lenArr:dword
countNameChars proto, ptrArray:ptr Student, lenArr:dword, ptrLenNamesArr:ptr byte
	
