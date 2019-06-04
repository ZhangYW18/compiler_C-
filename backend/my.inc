; ---------Now Function Is: sum ---------------
%define sum.argc 2

%MACRO $sum 0
	CALL @sum
	ADD ESP, 4*sum.argc
	PUSH EAX
%ENDMACRO

%MACRO sum.arg sum.argc
	%define sum.a [EBP + 8 + 4*sum.argc - 4*1]
	%define sum.b [EBP + 8 + 4*sum.argc - 4*2]
%ENDMACRO

%MACRO sum.var 0
	%define sum.c [EBP - 4*1]
	SUB ESP, 4
%ENDMACRO

%MACRO ENDFUNC@sum 0
	LEAVE
	RET
	%undef sum.a
	%undef sum.b
	%undef sum.c
%ENDMACRO


; ---------Now Function Is: main ---------------
%define main.argc 0

%MACRO $main 0
	CALL @main
	ADD ESP, 4*main.argc
	PUSH EAX
%ENDMACRO

%MACRO main.var 0
	%define main.b [EBP - 4*1]
	SUB ESP, 4
%ENDMACRO

%MACRO ENDFUNC@main 0
	LEAVE
	RET
	%undef main.b
%ENDMACRO


