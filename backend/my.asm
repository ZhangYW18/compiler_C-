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
	main.var a
	push 3
	pop a

	push 4
	push a
	$sum
	pop a

	push 0
	ret ~

ENDFUNC@main

