# Assignment 6
For this one, I had a lot of issues with extracting and decomplining any of them besides Crackme4 because Windows didn't like the encryption and IDA and Ghidra had issues with the binary aspect of the files, but I finally got them to work literally earlier today so I don't have much for that one, but here is the little I did find.

# Crackme 1 Solution (https://crackmes.dreamhosters.com/users/seveb/crackme05/download/crackme05.tar.gz)
I spent far too long trying to get this extracted and then opened, plus it wouldn't decompile in Ghidra, plus the assembly also would not display correctly, and the IDA version actually displayed functions but like 90% of them were empty and the others didn't just seemed to return their own parameter, except one function that I figured out was main(), but it didn't have any functions leading off of it that were decomplied correctly, so I had almost no time to reverse it nor could I actually run it, but here's what I got from reading through the assembly that was there:

When you run the program, it gives you this message:

![Screenshot 2024-03-25 220209](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/e21f62e8-a285-45ae-a9d4-43e178876a8e)


When you succeed, you recieve a message something along the lines of:
"Good job, you solved it in a glance! Now make a keygen!"        - I got this by reading a bunch of letters written vertically and seperated by other characters which made a screenshot really hard.

When you mess up, you get this message:

![Screenshot 2024-03-25 221414](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/a677e18a-eea8-4c88-913c-1ba98c6e623f)


I found that there were 11 different requirements (I couldn't get all of them) here:

![Screenshot 2024-03-25 214417](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/5a0b1077-c6f9-4e4e-a83f-e9595c8528e2)


From this image, there are 11 different functions that all probably have their own requirements in order to get through but I was only able to get the ones for rock to show up.
So I know that
1. It needs to be 19 characters.
2. And that's all I could figure out. :D


# Crackme4 Solution (https://crackmes.dreamhosters.com/users/hmx0101/decryptme_1/download/Decryptme%231.zip)
For Crackme4, the key that I found was 13438, which gave me the message: "Well Done!, Congratulations!!!" as shown in the screenshot below.

![Screenshot 2024-03-25 180800](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/0306d273-a887-47f6-b3b0-2118d3f846be)


As to how I got there, to be completely honest, it was a somewhat brute force attempt when I first ran it to see what would happen, I tried to put in some letters or numbers and nothing worked, so then I tried 1337, which wasn't anything, so I tried 1338 and I got like half the message decrypted like that.

After that I went into the code in Ghidra, got completely lost because everything was named pretty much the same thing so I opened it in IDA and it looked a lot neater so I ran both of them next to each other to compare and edited the code in Ghidra to look nicer.

In entry(), I found an if statement that ran 5 calls of function "SendMessageA" using different parameters (as shown in the screenshot below) so I assumed those were taking input from the GUI and then using them to decrypt the message, then I changed the variables names accordingly and changed the variables to be integer types.

![Screenshot 2024-03-25 181822](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/088b6169-46f7-42dd-950d-2b07fc7d1a78)


I looked through those and I couldn't find anything on how they decrypted anything so I kept looking but I couldn't find anything else. Then I went back to the application and tried a few different 5 character versions of 1338 and within like a minute I had gotten that message to display.

I continued looking through the code but couldn't find any other dead giveaways on finding the correct values for the password, so I moved onto attempting to get those other ones to even let me open them so I wouldn't be stuck with only one incomplete ransomware, but at least have work done on 2 of them.
