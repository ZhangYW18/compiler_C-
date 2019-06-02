; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
; To assemble and run:
;
;     nasm -felf64 hello.asm && ld hello.o && ./a.out
; ----------------------------------------------------------------------------------------
          [global    _start]

          [SECTION .text]
_start:   MOV      RAX, 1                  ; system call for write
          MOV      rdi, 1                  ; file handle 1 is stdout
          MOV       rsi, message            ; address of string to output
          MOV       rdx, 13                 ; number of bytes
          SYSCALL                          ; invoke operating system to do the write
          MOV     rax, 60                 ; system call for exit
          XOR       rdi, rdi                ; exit code 0
          SYSCALL                           ; invoke operating system to exit

          [SECTION   .data]
message:  DB        "Hello, World", 10      ; note the newline at the end
