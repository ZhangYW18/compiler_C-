; ---------Now Function Is: sum ---------------
%define sum.argc 2
%define sum.varc 1

%MACRO $sum 0
	CALL @sum
	ADD ESP, 4*sum.argc
	PUSH EAX
%ENDMACRO

%MACRO sum.arg sum.argc
	%define a [EBP + 8 + 4*sum.argc - 4*1]
	%define b [EBP + 8 + 4*sum.argc - 4*2]
%ENDMACRO

%MACRO sum.var sum.varc
	%define c [EBP - 4*1]
	SUB ESP, 4*sum.varc
%ENDMACRO

%MACRO ENDFUNC@sum 0
	LEAVE
	RET
	%undef a
	%undef b
	%undef c
%ENDMACRO


; ---------Now Function Is: main ---------------
%define main.argc 0
%define main.varc 2

%MACRO $main 0
	CALL @main
	ADD ESP, 4*main.argc
	PUSH EAX
%ENDMACRO

%MACRO main.var main.varc
	%define a [EBP - 4*1]
	%define b [EBP - 4*2]
	SUB ESP, 4*main.varc
%ENDMACRO

%MACRO ENDFUNC@main 0
	LEAVE
	RET
	%undef a
	%undef b
%ENDMACRO


