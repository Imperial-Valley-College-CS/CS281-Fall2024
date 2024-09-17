.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	hero byte "hulk",0
	lenHero = ($-hero)
	revHero byte lenHero DUP(?)

.code
	main proc
		
		mov esi, offset hero			;places address of first byte in hero into ESI
		add esi, lenHero
		mov edi, esi
		sub esi, 2

		mov al, [esi]					;grab k from hero
		mov [edi], al					;put k into revHero

		
		INVOKE ExitProcess, 0
	main endp
END main