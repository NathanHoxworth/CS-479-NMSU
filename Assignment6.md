# Assignment 6
For this one, I had a lot of issues with extracting and decomplining any of them besides Crackme4 because Windows didn't like the encryption and IDA and Ghidra had issues with the binary aspect of the files, but I finally got them to work literally earlier today so I don't have much for that one, but here is the little I did find.

# Crackme 1


# Crackme4 Solution (https://crackmes.dreamhosters.com/users/hmx0101/decryptme_1/download/Decryptme%231.zip)
For Crackme4, the key that I found was 13438, which gave me the message: "Well Done!, Congratulations!!!" as shown in the screenshot below.

As to how I got there, to be completely honest, it was a somewhat brute force attempt when I first ran it to see what would happen, I tried to put in some letters or numbers and nothing worked, so then I tried 1337, which wasn't anything, so I tried 1338 and I got like half the message decrypted like that.

After that I went into the code in Ghidra, got completely lost because everything was named pretty much the same thing so I opened it in IDA and it looked a lot neater so I ran both of them next to each other to compare and edited the code in Ghidra to look nicer.

In entry(), I found an if statement that ran 5 calls of function "SendMessageA" using different parameters (as shown in the screenshot below) so I assumed those were taking input from the GUI and then using them to decrypt the message, then I changed the variables names accordingly and changed the variables to be integer types.

I looked through those and I couldn't find anything on how they decrypted anything so I kept looking but I couldn't find anything else. Then I went back to the application and tried a few different 5 character versions of 1338 and within like a minute I had gotten that message to display.

I continued looking through the code but couldn't find any other dead giveaways on finding the correct values for the password, so I moved onto attempting to get those other ones to even let me open them.
