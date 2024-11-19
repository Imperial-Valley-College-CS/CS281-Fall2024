.386
.model flat, stdcall
.stack 4096

;---------------Constants------------------;
WriteConsole equ <WriteConsoleA>				;WriteConsoleA is a built-in Windows function
ReadConsole equ <ReadConsoleA>				;WriteConsoleA is a built-in Windows function

STD_OUTPUT_HANDLE equ -11
STD_INPUT_HANDLE equ -10

MAX_CHARS_READ = 1000