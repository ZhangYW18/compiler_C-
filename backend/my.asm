FUNC @sum:
	sum.arg a,b
 	sum.var c
	push a
	push b
	add
	pop c

	push c
	ret ~

ENDFUNC@sum

FUNC @main:
	main.var a, b
	push 3
	pop a

	push 5
	pop b

_begWhile_1:
	push b
	push 0
	cmpgt
	jz _endWhile_1
_begIf_1:
	push a
	push 4
	add
	push 15
	cmpls
	jz _elIf_1
	push 4
	push a
	$sum
	pop a

	jmp _endIf_1
_elIf_1:
	push 1
	push a
	add
	pop a

_endIf_1:

	push 1
	push b
	sub
	neg
	pop b

	jmp _begWhile_1
_endWhile_1:

	push 1
	push a
	sub
	neg
	pop a

	push 0
	ret ~

ENDFUNC@main

