# Assignment 8

# OSINT
NjRAT is a malware that has keylogging capabilities, webcam access, can upload and download files, steal any saved browser credentials, execute shell commands, modify regstries, take screen captures, and view the desktop of the computer, as well as open a backdoor for any attackers to use to gain access to the machine. 
It was first found in 2012 and is still used today by many attackers to gain access to systems across the world. Most recently, it has been used against organizations in the Middle East and North Africa. 
It is mostly spread through removable drives, phishing attacks, and interacting with other malicious software. 
It is also coommonly used for botnet C&C and was responsible for many of the attacks against Ukraine using its botnet capabilities. 
NjRAT also uses fileless storage by storing all of its keylogged data within a registry named '[kl]' and avoids saving any .dll plugins as files, but rather as registries, so as to be harder for any antivirus to remove them.

Capabilities: https://www.checkpoint.com/cyber-hub/threat-prevention/what-is-malware/what-is-njrat-malware/

Dates / Features: https://www.splunk.com/en_us/blog/security/more-than-just-a-rat-unveiling-njrat-s-mbr-wiping-capabilities.html#:~:text=NjRAT%20(also%20known%20as%20Bladabindi,was%20first%20discovered%20in%202012.

Another source I found: https://github.com/Samsar4/Ethical-Hacking-Labs/blob/master/6-Malware/1-Using-njRAT.md

# RegShot
My RegShot showed that 2 keys got deleted, both of them relating to the Cache in my Internet Settings of my Windows Software, and then I had 126 keys added that seemed to be opening the backdoor for the attacker by adding zones to the internet, adding keys to the trusted people folder, and going into the shell and I'm assuming generating keys that allow the attacker to have administrator privileges on the machine. It goes through so many different files and seems to allow so much access that it would have complete control of the machine, which I feel like would make it incredibly difficult to remove, especially because it doesn't store any of it's value in the file storage system. Something to look for in the registry would be lots of keys being added, and then dead giveaway being a value being added to the shell with a new friendly application called "njRAT" from a company called "njq8".

NjRAT creates a copy of itself into the Temp folder under Local in the AppData of the Users directory and also onto the main root directory under C:\. This seems to be because it wants it to be recognized as a normal user but also be able to acquire root privileges when needed because running as a standard user is harder to detect, but then switching to root when needed would allow it to gain the access to the systems it needs to function. To find this, you would need to look for anything weird being added into your user folders or even onto the main root directory, since something there has more devastating consequences than just as a standard user.

# FakeNet
NjRAT seems to request the domain from zaaptoo.zapto.org which according to https://bazaar.abuse.ch/sample/fd624aa205517580e83fad7a4ce4d64863e95f62b34ac72647b1974a52822199/, is some sort of website called by only NjRAT, which makes me think it was something setup by the creators of NjRAT. It also seems to utilize a lot of Microsoft's built in internet functions like msftncsi and msftconnecttest, whcih are used to check internet availabilty before it tries to call to zaaptoo again. So it is sending a request out to try and ensure there is a connection, then sending another request to it's own servers that likely contain payloads or something to be dropped onto the computer and notifying it's owner of the newly infected computer so that they can go into it and do whatever it is they want to do. A network admin would just need to look for weird requests, like zaaptoo or anything abnormal because this kind of virus likes to take control of the system and then use it's built in functions to do most of the work since it would go mostly undetected.
