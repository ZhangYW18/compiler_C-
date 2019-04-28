all:
	yacc -d assignment.y
	lex assignment.l
	gcc -o assignment lex.yy.c y.tab.c
