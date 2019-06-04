;exit语句，程序正常运行结束
%MACRO exit 1
    MOV EAX, 1
    MOV EBX, %1
    INT 0x80
%ENDMACRO

;编写跳转语句
%MACRO jz 1
    POP EAX
    OR EAX, EAX
    JZ %1
%ENDMACRO

%MACRO jmp 1
    JMP %1
%ENDMACRO

;编写push和pop语句
%MACRO push 1
    PUSH DWORD %1
%ENDMACRO

%MACRO pop 0-1
    %IFIDN %0, 0
        ADD ESP, 4			;没有参数，只有pop则更新栈指针
    %ELSE
        POP DWORD %1		;否则pop栈顶到指定位置（pop x）
    %ENDIF
%ENDMACRO

;算数计算语句，取栈顶的变量进行计算，原理和代码大致相同
;各个语句的细节在汇编语言课上学习过

%MACRO add 0
    POP EAX
    ADD DWORD [ESP], EAX
%ENDMACRO

%MACRO sub 0
    POP EAX
    SUB DWORD [ESP], EAX
%ENDMACRO

%MACRO mul 0
    POP EAX
    MUL DWORD [ESP]
    MOV [ESP], EAX
%ENDMACRO

%MACRO div 0
    XOR EDX, EDX
    POP EBX
    POP EAX
    DIV EBX
    PUSH EAX
%ENDMACRO

%MACRO mod 0
    XOR EDX, EDX
    POP EBX
    POP EAX
    DIV EBX
    PUSH EDX
%ENDMACRO

%MACRO neg 0
    NEG DWORD [ESP]
%ENDMACRO

%MACRO or 0
    POP EAX
    OR DWORD [ESP], EAX
%ENDMACRO

%MACRO and 0
    POP EAX
    AND DWORD [ESP], EAX
%ENDMACRO

%MACRO not 0
    XOR DWORD [ESP], 0FFFFFFFFH
%ENDMACRO

;比较语句的编写方法也大致相同，先比较，再利用flags寄存器的标志位来获得结果
%MACRO cmpeq 0
    MOV EAX, [ESP+4]
    CMP EAX, [ESP]
    PUSHF
    POP EAX
    SHR EAX, 6
    AND EAX, 0X1
    ADD ESP, 4
    MOV [ESP], EAX
%ENDMACRO

%MACRO cmpne 0
    MOV EAX, [ESP+4]
    CMP EAX, [ESP]
    PUSHF
    POP EAX
    SHR EAX, 6
    AND EAX, 0X1
    XOR EAX, 0X1
    ADD ESP, 4
    MOV [ESP], EAX
%ENDMACRO

%MACRO cmpge 0
    MOV EAX, [ESP+4]
    CMP EAX, [ESP]
    PUSHF
    POP EAX
    SHR EAX, 7
    AND EAX, 0X1
    XOR EAX, 0X1
    ADD ESP, 4
    MOV [ESP], EAX
%ENDMACRO

%MACRO cmple 0
    POP EAX
    CMP EAX, [ESP]
    PUSHF
    POP EAX
    SHR EAX, 7
    AND EAX, 0X1
    XOR EAX, 0X1
    MOV [ESP], EAX
%ENDMACRO

%MACRO cmpls 0
    MOV EAX, [ESP+4]
    CMP EAX, [ESP]
    PUSHF
    POP EAX
    SHR EAX, 7
    AND EAX, 0X1
    ADD ESP, 4
    MOV [ESP], EAX
%ENDMACRO

%MACRO cmpgt 0
    POP EAX
    CMP EAX, [ESP]
    PUSHF
    POP EAX
    SHR EAX, 7
    AND EAX, 0X1
    MOV [ESP], EAX
%ENDMACRO

;函数调用
;和汇编语言相同，调用时先保存当前位置
%MACRO FUNC 1
    %1
    PUSH EBP
    MOV EBP, ESP
%ENDMACRO

%MACRO ret 0-1
    %IFIDN %0, 1
        %IFIDN %1, ~
            MOV EAX, [ESP]
        %ELSE
            MOV EAX, %1
        %ENDIF
    %ENDIF
    LEAVE
    RET
%ENDMACRO



GLOBAL _start

%include "my_global_var.inc"

[SECTION .text]
_start:
	CALL @main
	PUSH EAX
	exit [ESP]
