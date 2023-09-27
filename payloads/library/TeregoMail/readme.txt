Payload     : TeregoMail
Version     : 20230925
Author      : Teregoal

This is a Hak5 Bashbunny payload script. It will use Outlook to send an awareness email to the
loggedin user. To demonstrate the risk of an unlocked computer it scans the computer for wifi
passwords and sends a the (masked) passwords in the email.  

-----------------------------------------------------------------------------------------------

This payload ...

... is free to use
... is to use at your own risk and resposibility
... is build for security awareness reasons
... is not meant to use for malicious activities
... is unsupported
... is tested on Windows 10 only
... is supposed to be in the folder \payloads\library\TeregoMail of your Bashbunny
... uses the vbs script \payloads\library\TeregoMail\scripts\SendOutlookMail.txt
... uses cscript.exe and netsh.exe 

-----------------------------------------------------------------------------------------------

How to use

1. Place the folder TeregoMail in the folder \payloads on your Bashbunny 
2. Copy the file payload.txt to either \payloads\switch1 or \payloads\switch2 on your Bashbunny
3. Make sure you'll end up with this tree

   \payloads\library\TeregoMail
   \payloads\library\TeregoMail\payload.txt
   \payloads\library\TeregoMail\readme.txt
   \payloads\library\TeregoMail\templates
   \payloads\library\TeregoMail\templates\MailTemplate_EN.html
   \payloads\library\TeregoMail\scripts\
   \payloads\library\TeregoMail\scripts\TeregoMail.cmd
   \payloads\library\TeregoMail\scripts\SendOutlookMail.txt
   \payloads\switchx\payload.txt

4. Set your Bash Bunny to the proper switch and go.
