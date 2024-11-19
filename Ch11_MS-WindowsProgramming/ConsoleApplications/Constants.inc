.386
.model flat, stdcall
.stack 4096

;---------------Constants------------------;
WriteConsole equ <WriteConsoleA>				;WriteConsoleA is a built-in Windows function

STD_OUTPUT_HANDLE equ -11