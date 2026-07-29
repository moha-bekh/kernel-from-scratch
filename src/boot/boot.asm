bits 32
global _start

section .text
_start:
	push ebx
	push eax
	extern kmain
	call kmain
	hlt