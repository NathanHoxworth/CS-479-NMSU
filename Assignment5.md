[secret.txt](https://github.com/NathanHoxworth/CS-479-NMSU/files/14645703/secret.txt)[secret.txt](https://github.com/NathanHoxworth/CS-479-NMSU/files/14645681/secret.txt)# Assignment 5 - Ransomware Decryption
I struggled a lot with this assignment for some reason, I wasn't able to find key for the second one, I thought it was 20 but I guess I was wrong. I will keep looking until I find it, and then post an updated section once I do.
I spent almost the entire break on it in both IDA and Ghidra and still had no luck, but I will keep going until I get it.

# Ransomware 1

Here is my decryption code:


#!/usr/bin/env python3

import sys

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Error: Invalid argument")
        sys.exit(1)
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    key = b'4'

    with open(input_file, "rb") as inf:
        with open(output_file, "wb") as outf:
            contents = inf.read()

            for i, byte in enumerate(contents):
                decrypted_byte = byte ^ key[i % len(key)]
                outf.write(bytes([decrypted_byte]))



Here is my secret.txt file:

Dear Student,

You have decrypted the message. Good job!

"Many of the engineers I interviewed worked on reverse-engineering technology. It’s a hallmark of Area 51."
 ~ ANNIE JACOBSEN

Go NMSU RE!



I couldn't get a single screenshot of the code because my laptop screen was too small, so I could only get it as 2, but here is a neater version of the code as we did in the lecture video:

![Ghidra1](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/2e69d980-226f-49af-884d-7fd6aee15c40)

![Ghidra2](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/a36b23fd-b40c-45ba-97f8-0d71b9c54809)

# Ransomware 2

Here is my decrypt file:


#!/usr/bin/env python3

import sys

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Error: Incorrect number of arguments")
        sys.exit(1)
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    key = b'20'


    with open (input_file, "rb") as inf:
        with open(output_file, "wb") as outf:
            
            contents = inf.read()

            for i, byte in enumerate(contents):
                decrypted_byte = byte ^ key[i % len(key)]
                outf.write(bytes([decrypted_byte]))


Here is my secret.txt file:

[UpGf`u#Purgfos/
	Znr#k`qf#eb`qxwwfe'wkd'nfrtbdd)#Dnhg#kha"
	#Ebphdbom~/#ha#qdqfqrb#fo`jmdbqjo`#jr'aboifg-'wkdi#b!klw!he#uof#nwfm!tlvsdf#bhnntijwx'jp!clllbg#uh#e`no-#
	#'Ilo'Ofbo#Inobmrbm
	Dn'MNRR#QD&loading secret.txt…]()

 Here is the screenshot of the more human readable code in IDA:

![IDA Screenshot](https://github.com/NathanHoxworth/CS-479-NMSU/assets/122402730/c084680f-4708-42fd-80f3-734e6bbce9af)


# What I did
So for the first one, I just followed along with the video and even started by creating the same decryption file as done in the demonstration. After that, I decided to try my hand at ransomware2 which I did by trying to follow along in the video again, but I started to get lost pretty fast. 
Ransomware 2 had a lot more stuff going on in Ghidra that made it hard to track what was what and so I spent several days trying to figure out what the heck was going on, but to no avail. 
So after that, I tried openining it in IDA and the code in IDA was a lot easier to read, so I did a quick skim through there and renamed a few of the variables and found what I thought was the key as an unsigned int set to 20u, so I went back to Ghidra to find 20, and it was there in a similar spot, so I thought it must've been the key. 
And then I put 20 into the same decryption program and it gave me some errors so I decided to write my own based heavily off of the one in the demonstration, but with a few more things to cover the issues I was experiencing with 20 not being a char value. 
However, I couldn't get it to give me any sort of value that was legible words, so I would keep going back into Ghidra and IDA to see what I could've missed but I didn't find anything else. So I tried my program on the first one and it still worked, so I knew it wasn't an issue with my program. 
I just ended up running out of time due to many other projects and having 4 midterms to do, but I'm going to keep cracking at it!

# Decryption program
So my decryption program essentially does the same thing as the one in the video, but I added it into main since I was getting some issues with that for some reason. 
Then I did the same thing as the other program by printing out an error for incorrect format and taking the files as input / output and setting a key variable. I also copied the code with setting the input and output files as inf and outf but needed to change the output to be bytes as well because of some errors I recieved. 
In the loop, I made it loop through the contents with the enumerate function to return both the idnex i and the corresponding byte so that I could XOR each byte from the input file with the byte from the key that is at the current index of i % length of the key. 
Then I just had it write out the result to my output file so that I could try and get a readable string of bytes.



