all:
	nasm -e  -P "macro.inc" -P "my.inc" my.asm >my_final.asm
	nasm -f elf32 -F dwarf  -P "macro.inc" -P "my.inc" my.asm
	ld -m elf_i386 -o my my.o
