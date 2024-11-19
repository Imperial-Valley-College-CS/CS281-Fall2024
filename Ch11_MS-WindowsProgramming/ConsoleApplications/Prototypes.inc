include Constants.inc

;---------------Win32 Prototypes------------------;
ExitProcess proto, 
	dwExitCode:dword
GetStdHandle proto, 
	nStdHandle:dword
WriteConsole proto,
	consoleOutHandle:dword,
	ptrString:ptr byte,
	nCharsToWrt:dword,
	ptrCharsWrtn:ptr dword,
	lpReserved:dword

;---------------User-defined Prototypes------------------;
WriteString proto,
	ptrString:ptr byte
LenStr proto,						
		ptrString: ptr byte