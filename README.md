# CS 479/579 Reverse Engineering at NMSU

This is a repo for holding my reports on reverse engineering malware in this course using samples from "Practical Malware Analysis"

# System Setup:
  I began my work by setting up my system to be a secure place to begin my work practicing reverse engineering.
  The first thing I did was begin to setup an isolated system using a Windows 11 VM on a Linux OS. Then I got some tools installed on the VM that would help with my reverse engineering and then disconnected the VM from the network.
  This isolation is important as it contains any malware to the virtual machine and doesn't allow it to have any network access. I made sure to install the Windows VM onto Linux so that if the virus does manage to escape onto the system OS, it will be in an unfamiliar environment where it wouldn't be able to do anything and also to ensure I don't get confused as to which system I am currently working in.
I disabled Windows Defender on the machine as well to ensure that I would be succesfuly able to install the malware and do my work on it without being hindered by the Defender. I disabled it using a few commands run through the Powershell as an admin and then going into the task scheduer and disabled the the Windows Defender tasks and then made sure to reboot the system to ensure it didn't start itself back up.

# Tools
The tools I'm using during this semester are IDA Education and 70 something tools from FlareVM.
IDA Education disassembles malware and creates maps to show binary instructions executed by the process in assembly
FlareVM is a large package of tools that all can be used in malware analysis and have different functions to help with different tasks.
