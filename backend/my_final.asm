%line 1+1 macro.inc

%line 7+1 macro.inc


%line 14+1 macro.inc

%line 18+1 macro.inc


%line 23+1 macro.inc

%line 31+1 macro.inc




%line 39+1 macro.inc

%line 44+1 macro.inc

%line 50+1 macro.inc

%line 58+1 macro.inc

%line 66+1 macro.inc

%line 70+1 macro.inc

%line 75+1 macro.inc

%line 80+1 macro.inc

%line 84+1 macro.inc


%line 96+1 macro.inc

%line 108+1 macro.inc

%line 120+1 macro.inc

%line 131+1 macro.inc

%line 142+1 macro.inc

%line 152+1 macro.inc



%line 160+1 macro.inc

%line 172+1 macro.inc



[global _start]

%line 1+1 my_global_var.inc

 [SECTION .data]
a: DD 0
%line 178+1 macro.inc

[SECTION .text]
_start:
 CALL @main
 PUSH EAX
 MOV EAX, 1
%line 183+0 macro.inc
 MOV EBX, [ESP]
 INT 0x80
%line 1+1 my.inc



%line 9+1 my.inc

%line 14+1 my.inc

%line 19+1 my.inc

%line 27+1 my.inc





%line 37+1 my.inc

%line 42+1 my.inc

%line 48+1 my.inc


%line 1+1 my.asm
 @sum:
%line 1+0 my.asm
 PUSH EBP
 MOV EBP, ESP
%line 3+1 my.asm
 SUB ESP, 4
 PUSH DWORD [EBP + 8 + 4*2 - 4*1]
 PUSH DWORD [EBP + 8 + 4*2 - 4*2]
 POP EAX
%line 6+0 my.asm
 ADD DWORD [ESP], EAX
%line 7+1 my.asm
 POP DWORD [EBP - 4*1]

 PUSH DWORD [EBP - 4*1]
 MOV EAX, [ESP]
%line 10+0 my.asm
 LEAVE
 RET
%line 11+1 my.asm

 LEAVE
%line 12+0 my.asm
 RET
%line 13+1 my.asm

 @main:
%line 14+0 my.asm
 PUSH EBP
 MOV EBP, ESP
%line 15+1 my.asm
 SUB ESP, 4
 PUSH DWORD 3
 POP DWORD [a]

 PUSH DWORD 5
 POP DWORD [EBP - 4*1]

_begWhile_1:
 PUSH DWORD [EBP - 4*1]
 PUSH DWORD 0
 POP EAX
%line 25+0 my.asm
 CMP EAX, [ESP]
 PUSHF
 POP EAX
 SHR EAX, 7
 AND EAX, 0X1
 MOV [ESP], EAX
%line 26+1 my.asm
 POP EAX
%line 26+0 my.asm
 OR EAX, EAX
 JZ _endWhile_1
%line 27+1 my.asm
_begIf_1:
 PUSH DWORD [a]
 PUSH DWORD 4
 POP EAX
%line 30+0 my.asm
 ADD DWORD [ESP], EAX
%line 31+1 my.asm
 PUSH DWORD 15
 MOV EAX, [ESP+4]
%line 32+0 my.asm
 CMP EAX, [ESP]
 PUSHF
 POP EAX
 SHR EAX, 7
 AND EAX, 0X1
 ADD ESP, 4
 MOV [ESP], EAX
%line 33+1 my.asm
 POP EAX
%line 33+0 my.asm
 OR EAX, EAX
 JZ _elIf_1
%line 34+1 my.asm
 PUSH DWORD 4
 PUSH DWORD [a]
 CALL @sum
%line 36+0 my.asm
 ADD ESP, 4*2
 PUSH EAX
%line 37+1 my.asm
 POP DWORD [a]

 JMP _endIf_1
_elIf_1:
 PUSH DWORD 1
 PUSH DWORD [a]
 POP EAX
%line 43+0 my.asm
 ADD DWORD [ESP], EAX
%line 44+1 my.asm
 POP DWORD [a]

_endIf_1:

 PUSH DWORD 1
 PUSH DWORD [EBP - 4*1]
 POP EAX
%line 50+0 my.asm
 SUB DWORD [ESP], EAX
%line 51+1 my.asm
 NEG DWORD [ESP]
 POP DWORD [EBP - 4*1]

 JMP _begWhile_1
_endWhile_1:

 PUSH DWORD 1
 PUSH DWORD [a]
 POP EAX
%line 59+0 my.asm
 SUB DWORD [ESP], EAX
%line 60+1 my.asm
 NEG DWORD [ESP]
 POP DWORD [a]

 PUSH DWORD 5
 PUSH DWORD [a]
 POP EAX
%line 65+0 my.asm
 ADD DWORD [ESP], EAX
%line 66+1 my.asm
 POP DWORD [EBP - 4*1]

 PUSH DWORD 0
 MOV EAX, [ESP]
%line 69+0 my.asm
 LEAVE
 RET
%line 70+1 my.asm

 LEAVE
%line 71+0 my.asm
 RET
%line 72+1 my.asm

