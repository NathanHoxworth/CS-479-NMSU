# Assignment 7

To find that it was injecting DLL, I just looked for where the program was making calls to WriteProcessMemory, VirtualAllocEx, or CreateRemoteThread. These were all found in the same method, which I labeled as the injection method since it seemed to be doing all that work.
![Screenshot from 2024-04-03 08-29-54](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/e8905433-2e5a-44c6-b0f9-9b6597e0a54a)

I found that the victim process was the Windows File Explorer. It is likely this was chosen since it is a process that already has access to the entire system so it would be much less likley to be caught by any malware detection systems on the computer and the OS would most likely grant any of its requests.
![Screenshot from 2024-04-03 08-30-38](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/07cdf248-9c66-4927-a03d-9a561cd251e0)

To find DllMain, I looked in the DLL file for a function of type __cdecl that takes in 3 parameters (as DllMain often does) that had a function to load the dll library and run some functions.
![Screenshot from 2024-04-03 08-39-04](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/ba512fbc-0825-45ea-bce3-a4ae35d98556)

The dll does something every 60,000 seconds in a create remote thread function, it runs a function using the name of the textbook which then gets passed to another function that I couldn't figure out what it does because it had so many switch cases and function calls.
![Screenshot from 2024-04-03 11-32-27](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/00467aee-94e2-439f-a4bd-88878c3515f0)
