# Assembly Review Excersises

1. What is the difference between machine code and assembly?
    
   Machine code is binary instructions that can be directly executed by the CPU, while assembly is a representation of machine code that can be read by humans.
   
3. If the ESP register is pointing to memory address 0x00000000001270A4 and I execute a pushq rax instruction, what address will rsp now be pointing to?
    
   After executing pushq rax, rsp will be decremented by 8 bytes and therefore be pointing to 0x00000000001279FC.
   
4. What is a stack frame?
    
   A stack frame is an area of memory that is allocated for function calls in the call stack, containing return addresses, parameters, and other data.
   
5. What would you find in a data section?
    
   The data section holds static variables that have been initialized so they can be used by the program.
   
6. What is the heap used for?
    
   The heap is used for dynamic memory allocation for when the program is being executed.
   
7. What is in the code section of a program's virtual memory space?
    
   The code section is where the logic is all contained so that it can be executed.
    
8. What does the inc instruction do, and how many operands does it take?
    
   Inc increments the value of its operand by 1.
    
9. If I perform a div instruction, where would I find the remainder of the binary division (modulo)?
    
   The remainder from a div instruction is stored in rax.
    
10. How does jz decide whether to jump or not?
    
   Jz decides to jump if the result of the previous operation was 0.
    
11. How does jne decide whether to jump or not?
    
    Jne jumps if the result of the previous operation was not 0.
    
12. What does a mov instruction do?
    
    Mov copies data from a source operand to a destination operand, overwriting the previous value of the destination operand.
    
13. What does the TF flag do, and why is it useful for debugging?
    
    It sets a trap after the execution of each instruction, which lets you have a more detailed debugging of the code.
    
14. Why would an attacker want to control the RIP register inside a program they want to take control of?
    
    An attacker would want to control the RIP register because it allows them to change the execution flow of a program to malicious code that does whta they want.
    
15. What is the ax register and how does it relate to rax?
    
    Ax is the lower 16 bits of the 64 bit version of rax, it is the accumulator register used for arithmetic operations.
    
16. What is the result of the instruction xor rax, rax and where is it stored?
    
    This instruction sets the rax register to 0.
    
17. What does the leave instruction do in terms of registers to leave a stack frame?
    
    The leave instruction restores the stack pointer and base pointer to their previous state before the function call, which leaves the stack frame.
    
18. What pop instruction is retn equivalent to?
    
    Retn is equivalent to the pop instruction pop rip.
    
19. What is a stack overflow?
    
    A stack overflow is when a program exhausts all the available space in its call stack. This is usually due to excessive recursion or allocating large variables when there isn't enough space.
    
20. What is a segmentation fault (a.k.a. a segfault)?
    
    A segfault occurs when a program tries to access memory outside of its allowed access.
    
21. What are the RSI and RDI registers for that gives them their name?
    
    Rsi stands for "source index", while rdi stands for "destination index".
    
# Crackme open in Ghidra and IDA


# IDA or Ghidra?
The solution I found to the crackme was that it wanted any number that was evenly divisble by 1223. I found this by looking through the C code for the main function, and then following all the function calls to see what each function does and in the function validate_key, I saw a line of code saying to return 1 if the input passed to the function (the input given by the user) % 1223 == 0.

I also noticed that any input that started with any non integer value, would be immediately taken as correct input which I found out by messing around with it. This means that it reads through each character and once it encounters any non integer value, it stops sends the value that it has read so far, if the numbers it has read so far are not evenly divisble by 1223, then it would say no, but if it encountered any non integer value first, the function would automatically return 1.

# More helpful
I found using IDA to be a lot more helpful to me, because it was a lot more visually appealing, which is helpful to me since I am a visual learner, and I found some very clear tutorials on how to get started with crackme files in IDA that helped me easily navigate it.
