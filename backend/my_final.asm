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

[SECTION .text]
_start:
 CALL @main
 PUSH EAX
 MOV EAX, 1
%line 179+0 macro.inc
 MOV EBX, [ESP]
 INT 0x80
%line 1+1 my.inc

%line 4+1 my.inc

%line 10+1 my.inc

%line 15+1 my.inc

%line 20+1 my.inc

%line 28+1 my.inc



%line 33+1 my.inc

%line 39+1 my.inc

%line 45+1 my.inc

%line 52+1 my.inc


%line 1+1 my.asm
 @sum:
%line 1+0 my.asm
 PUSH EBP
 MOV EBP, ESP
%line 3+1 my.asm
 SUB ESP, 4*1
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
 SUB ESP, 4*2
 PUSH DWORD 3
 POP DWORD [EBP - 4*1]

 PUSH DWORD 1
 PUSH DWORD [EBP - 4*1]
 POP EAX
%line 21+0 my.asm
 SUB DWORD [ESP], EAX
%line 22+1 my.asm
 NEG DWORD [ESP]
 POP DWORD [EBP - 4*1]

 PUSH DWORD 5
 POP DWORD [EBP - 4*2]

_begWhile_1:
 PUSH DWORD [EBP - 4*2]
 PUSH DWORD 0
 POP EAX
%line 31+0 my.asm
 CMP EAX, [ESP]
 PUSHF
 POP EAX
 SHR EAX, 7
 AND EAX, 0X1
 MOV [ESP], EAX
%line 32+1 my.asm
 POP EAX
%line 32+0 my.asm
 OR EAX, EAX
 JZ _endWhile_1
%line 33+1 my.asm
_begIf_1:
 PUSH DWORD [EBP - 4*1]
 PUSH DWORD 4
 POP EAX
%line 36+0 my.asm
 ADD DWORD [ESP], EAX
%line 37+1 my.asm
 PUSH DWORD 15
 MOV EAX, [ESP+4]
%line 38+0 my.asm
 CMP EAX, [ESP]
 PUSHF
 POP EAX
 SHR EAX, 7
 AND EAX, 0X1
 ADD ESP, 4
 MOV [ESP], EAX
%line 39+1 my.asm
 POP EAX
%line 39+0 my.asm
 OR EAX, EAX
 JZ _elIf_1
%line 40+1 my.asm
 PUSH DWORD 4
 PUSH DWORD [EBP - 4*1]
 CALL @sum
%line 42+0 my.asm
 ADD ESP, 4*2
 PUSH EAX
%line 43+1 my.asm
 POP DWORD [EBP - 4*1]

 JMP _endIf_1
_elIf_1:
 PUSH DWORD 1
 PUSH DWORD [EBP - 4*1]
 POP EAX
%line 49+0 my.asm
 ADD DWORD [ESP], EAX
%line 50+1 my.asm
 POP DWORD [EBP - 4*1]

_endIf_1:

 PUSH DWORD 1
 PUSH DWORD [EBP - 4*2]
 POP EAX
%line 56+0 my.asm
 SUB DWORD [ESP], EAX
%line 57+1 my.asm
 NEG DWORD [ESP]
 POP DWORD [EBP - 4*2]

 JMP _begWhile_1
_endWhile_1:

 PUSH DWORD 1
 PUSH DWORD [EBP - 4*1]
 POP EAX
%line 65+0 my.asm
 SUB DWORD [ESP], EAX
%line 66+1 my.asm
 NEG DWORD [ESP]
 POP DWORD [EBP - 4*1]

 PUSH DWORD 0
 MOV EAX, [ESP]
%line 70+0 my.asm
 LEAVE
 RET
%line 71+1 my.asm

 LEAVE
%line 72+0 my.asm
 RET
%line 73+1 my.asm

