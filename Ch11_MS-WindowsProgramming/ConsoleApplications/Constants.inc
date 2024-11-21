.386
.model flat, stdcall
.stack 4096

;;---------------Links ------------------;
;https://learn.microsoft.com/en-us/windows/win32/secauthz/generic-access-rights

;---------------Win32 Procedures------------------;
CreateFile 	EQU <CreateFileA>
WriteConsole equ <WriteConsoleA>				;WriteConsoleA is a built-in Windows function
ReadConsole equ <ReadConsoleA>				;WriteConsoleA is a built-in Windows function

STD_OUTPUT_HANDLE equ -11
STD_INPUT_HANDLE equ -10
GENERIC_WRITE					= 40000000h		;write access
GENERIC_READ     					= 80000000h		;read access 
DO_NOT_SHARE 					= 0						;if 0, file cannot be shared until handle to file is closed
NULL 										= 0
FILE_ATTRIBUTE_NORMAL	= 80h
OPEN_EXISTING      				= 3						;opens file only if it exists

MAX_CHARS_TO_READ = 1000
;---------------Win32 Types------------------;
handle TEXTEQU <dword>
