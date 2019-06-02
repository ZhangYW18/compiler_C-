all:
	yacc -d ./frontend/assignment.y
	lex ./frontend/assignment.l
	gcc -o ./assignment lex.yy.c y.tab.c
	./assignment  test.c >./backend/my.asm
	rm -rf lex.yy.c y.tab.c y.tab.h
