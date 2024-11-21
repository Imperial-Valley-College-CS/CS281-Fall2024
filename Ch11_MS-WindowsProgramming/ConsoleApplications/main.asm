include Prototypes.inc

.data
	message byte "Happy Birthday",0dh, 0ah
		byte "To You!",0
	lenMsg = ($-message)
	message2 byte "And Happy Thanksgiving",0dh, 0ah, 0
	buffer byte MAX_CHARS_TO_READ DUP(0)
	file byte "Roster.txt",0

.code
	main proc
		
		;invoke ReadString, addr buffer
		;invoke WriteString, addr buffer
		invoke ReadFromFile, addr buffer, addr file												;user-defined
		

		
		INVOKE ExitProcess, 0
	main endp
	
	

END main