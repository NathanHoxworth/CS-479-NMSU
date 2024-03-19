[secret.txt](https://github.com/NathanHoxworth/CS-479-NMSU/files/14645703/secret.txt)[secret.txt](https://github.com/NathanHoxworth/CS-479-NMSU/files/14645681/secret.txt)# Assignment 5 - Ransomware Decryption
I struggled a lot with this assignment for some reason, I wasn't able to find key for the second one, I thought it was 20 but I guess I was wrong. I will keep looking until I find it, and then post an updated section once I do.
I spent almost the entire break on it in both IDA and Ghidra and still had no luck, but I will keep going until I get it.

# Ransomware 1

Here is my decryption code:

[Upl#!/usr/bin/env python3

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

oading decrypt.py…]()


Here is my secret.txt file:

[UploadiDear Student,

You have decrypted the message. Good job!

"Many of the engineers I interviewed worked on reverse-engineering technology. It’s a hallmark of Area 51."
 ~ ANNIE JACOBSEN

Go NMSU RE!ng secret.txt…]()



I couldn't get a screenshot of the code because my laptop screen was too small, so I could only see small bits of it even while fullscreened, but here is the code written out a bit more nicely as done in the lecture video:

int decrypt(EVP_PKEY_CTX *to_decrypt,uchar *out,size_t *outlen,uchar *in,size_t inlen)
{
  uint return_val;
  undefined *puVar1;
  undefined *puVar2;
  int in_GS_OFFSET;
  undefined4 uStackY_60;
  int iStack_50;
  undefined auStack_4c [8];
  uchar *local_44;
  EVP_PKEY_CTX *filename;
  byte char_four;
  int i;
  int is_one;
  undefined4 infile_handle;
  int filelength;
  undefined4 outfile;
  undefined4 bytes_read;
  int bytes_written;
  byte one_byte_buff;
  uint local_10;
  
  filename = to_decrypt;
  local_44 = out;
  local_10 = *(uint *)(in_GS_OFFSET + 0x14);
  char_four = '4';
  is_one = 1;
  infile_handle = fopen(to_decrypt,&DAT_00012040);
  SeekTheEnd(infile_handle,0,2);
  filelength = ReadFilePTROffset(infile_handle);
  Rewind(infile_handle);
  printf_2_args("Decrypting encrypted file \"%s\". It is %ld bytes long.\n",filename,filelength);
  outfile = fopen(local_44,&WB);
  puVar2 = auStack_4c;
  for (i = 0; i < filelength; i = i + 1) {
    *(undefined4 *)(puVar2 + -4) = infile_handle;
    *(int *)(puVar2 + -8) = is_one;
    *(undefined4 *)(puVar2 + -0xc) = 1;
    *(byte **)(puVar2 + -0x10) = &one_byte_buff;
    *(undefined4 *)(puVar2 + -0x14) = 0x11496;
    bytes_read = READFILE();
    one_byte_buff = one_byte_buff ^ char_four;
    *(undefined4 *)(puVar2 + -4) = outfile;
    *(undefined4 *)(puVar2 + -8) = 1;
    *(undefined4 *)(puVar2 + -0xc) = 1;
    *(byte **)(puVar2 + -0x10) = &one_byte_buff;
    *(undefined4 *)(puVar2 + -0x14) = 0x114b6;
    bytes_written = FWRITE();
    puVar1 = puVar2;
    if (is_one != bytes_written) {
      *(int *)(puVar2 + -4) = is_one;
      *(int *)(puVar2 + -8) = bytes_written;
      *(EVP_PKEY_CTX **)(puVar2 + -0xc) = filename;
      puVar1 = puVar2 + -0x10;
      *(char **)(puVar2 + -0x10) = "ERROR decrypting \"%s\". Blocks written: %d, expected %d";
      *(undefined4 *)(puVar2 + -0x14) = 0x114d9;
      printf_2_args();
      *(undefined4 *)(puVar2 + -0x10) = 7;
      *(undefined4 *)(puVar2 + -0x14) = 0x114e6;
      Die();
    }
    puVar2 = puVar1;
  }
  return_val = local_10 ^ *(uint *)(in_GS_OFFSET + 0x14);
  if (return_val != 0) {
    *(undefined4 *)(puVar2 + -4) = 0x11504;
    return_val = __stack_chk_fail_local();
  }
  return return_val;
}

# Ransomware 2

Here is my decrypt file:

[Uplo#!/usr/bin/env python3

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


ading decrypt.py…]()

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



