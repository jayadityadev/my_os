org 0x7C00			; directive : tells the assembler where to expect the code. The bios should always be at 0x7C00
bits 16				; directive : tells the assmebler to emit 16-bit code

main:				; main label
	hlt				; haults/stops the CPU from executing, can be resumed by an interrupt

.halt:				; halt label
	jmp .halt		; if the CPU starts executing spontaneously, it makes it jump back to the halt label (goto)

times 510-($-$$) db 0 ; db is a directive stands for define byte. Writes given bytes to the assembled binary file
					  ; times is a directive that repeats given instruction/data a number of times
					  ; $ memory offset of current line
					  ; $$ memory offset of the beginning of the current section. Hence, $-$$ gives size in bytes of program so far
dw 0AA55h			; directive that stands for define word. Writes given word (2 byte value encoded in little endian) to the assembled binary file

