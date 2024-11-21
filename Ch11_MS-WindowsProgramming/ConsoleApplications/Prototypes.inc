include Constants.inc

;---------------Win32 Prototypes------------------;
CloseHandle proto,
	nHandle:handle
CreateFile PROTO,									; create new file
	lpFilename:PTR BYTE,							; ptr to filename
	dwDesiredAccess:DWORD,					; access mode
	dwShareMode:DWORD,						; share mode
	lpSecurityAttributes:DWORD,  			; pointer to security attributes
	dwCreationDisposition:DWORD,			; file creation options
	dwFlagsAndAttributes:DWORD,			; file attributes
	hTemplateFile:DWORD						; handle to template file
ExitProcess proto, 
	dwExitCode:dword
GetStdHandle proto, 
	nStdHandle:dword
ReadConsole proto,
	consoleInHandle:dword,
	ptrBuffer:ptr byte,
	nCharsToRead:dword,
	ptrCharsRead:ptr dword,
	lpReserved:dword
ReadFile PROTO,												; read from file
	hFileInput:HANDLE,									; output handle
	lpBuffer:PTR BYTE,										; pointer to buffer
	nNumberOfCharsToRead:DWORD,				; size of buffer
	lpNumberOfCharsRead:PTR DWORD,			; ptr to number of bytes read
	lpReserved:DWORD										; (not used)
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
	ptrString:ptr byte
ReadString proto,
	ptrBuffer:ptr byte
ReadFromFile proto,
	ptrBuffer:ptr byte,
	ptrFile:ptr byte
parseInt proto,
	ptrString: ptr byte
writeInt proto,
	nVal:dword