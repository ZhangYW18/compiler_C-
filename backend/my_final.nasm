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

%line 182+1 macro.inc

[global _start]

[SECTION .TEXT]
_start:
 CALL @main
 PUSH EAX
 MOV EAX, 1
%line 189+0 macro.inc
 MOV EBX, [ESP]
 INT 0x80
%line 1+1 my.inc

%line 4+1 my.inc

%line 10+1 my.inc

%line 16+1 my.inc

%line 23+1 my.inc



%line 28+1 my.inc

%line 34+1 my.inc

%line 39+1 my.inc

%line 44+1 my.inc

%line 52+1 my.inc


%line 3+1 my.nasm

 @main:
%line 4+0 my.nasm
 PUSH EBP
 MOV EBP, ESP
%line 5+1 my.nasm
 SUB ESP, 4*2
 PUSH DWORD 3
 POP DWORD [EBP - 4*1]

 PUSH DWORD 4
 PUSH DWORD [EBP - 4*1]
 CALL @sum
%line 11+0 my.nasm
 ADD ESP, 4*2
 PUSH EAX
%line 12+1 my.nasm
 POP DWORD [EBP - 4*2]

 PUSH DWORD 0
 MOV EAX, [ESP]
%line 15+0 my.nasm
 LEAVE
 RET
%line 16+1 my.nasm

 LEAVE
%line 17+0 my.nasm
 RET
%line 18+1 my.nasm

 @sum:
%line 19+0 my.nasm
 PUSH EBP
 MOV EBP, ESP
%line 21+1 my.nasm
 SUB ESP, 4*1
 PUSH DWORD [EBP + 8 + 4*2 - 4*1]
 PUSH DWORD [EBP + 8 + 4*2 - 4*2]
 POP EAX
%line 24+0 my.nasm
 ADD DWORD [ESP], EAX
%line 25+1 my.nasm
 POP DWORD [EBP - 4*1]

 PUSH DWORD [EBP - 4*1]
 MOV EAX, [ESP]
%line 28+0 my.nasm
 LEAVE
 RET
%line 29+1 my.nasm

 LEAVE
%line 30+0 my.nasm
 RET
%line 31+1 my.nasm

 MOV EAX, 1
%line 32+0 my.nasm
 MOV EBX, 0
 INT 0x80
