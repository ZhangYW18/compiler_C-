FUNC @sum:
	sum.arg sum.a, sum.b
 	sum.var
	push sum.a
	push sum.b
	add
	pop sum.c

	push sum.c
	ret ~

ENDFUNC@sum

FUNC @main:
	main.var
	push 3
	pop [a]

	push 5
	pop main.b

_begWhile_1:
	push main.b
	push 0
	cmpgt
	jz _endWhile_1
_begIf_1:
	push [a]
	push 4
	add
	push 15
	cmpls
	jz _elIf_1
	push 4
	push [a]
	$sum
	pop [a]

	jmp _endIf_1
_elIf_1:
	push 1
	push [a]
	add
	pop [a]

_endIf_1:

	push 1
	push main.b
	sub
	neg
	pop main.b

	jmp _begWhile_1
_endWhile_1:

	push 1
	push [a]
	sub
	neg
	pop [a]

	push 5
	push [a]
	add
	pop main.b

	push 0
	ret ~

ENDFUNC@main

