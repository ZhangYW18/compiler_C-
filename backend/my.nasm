%include "macro.inc"
%include "my.inc"

FUNC @main:
	main.var a, b
	push 3
	pop a

_begIf_1:
	push a
	push 2
	cmpgt
	jz _elIf_1
	push 3
	pop a

	jmp _endIf_1
_elIf_1:
	push 2
	pop a

_endIf_1:

_begWhile_1:
	push a
	push 1
	cmpgt
	jz _endWhile_1
	push 4
	push a
	$sum
	pop b

	push a
	push 1
	sub
	pop a

	jmp _begWhile_1
_endWhile_1:

	push 0
	ret ~

ENDFUNC@main

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

exit 0