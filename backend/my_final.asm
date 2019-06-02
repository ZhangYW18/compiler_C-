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

%line 44+1 my.inc

%line 50+1 my.inc


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
 SUB ESP, 4*1
 PUSH DWORD 3
 POP DWORD [EBP - 4*1]

 PUSH DWORD 4
 PUSH DWORD [EBP - 4*1]
 CALL @sum
%line 21+0 my.asm
 ADD ESP, 4*2
 PUSH EAX
%line 22+1 my.asm
 POP DWORD [EBP - 4*1]

 PUSH DWORD 0
 MOV EAX, [ESP]
%line 25+0 my.asm
 LEAVE
 RET
%line 26+1 my.asm

 LEAVE
%line 27+0 my.asm
 RET
%line 28+1 my.asm

