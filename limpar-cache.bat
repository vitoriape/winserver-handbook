@ECHO OFF

del /s /q Desktop
del /s /q Documents
del /s /q Downloads
del /s /q Pictures
del /s /q Music
del /s /q Videos
del /s /q OneDrive

del /q "Desktop"
FOR /D %%p IN ("Desktop\*.*") DO rmdir "%%p" /s /q

del /q "Documents"
FOR /D %%p IN ("Documents\*.*") DO rmdir "%%p" /s /q

del /q "Downloads"
FOR /D %%p IN ("Downloads\*.*") DO rmdir "%%p" /s /q

del /q "Pictures"
FOR /D %%p IN ("Pictures\*.*") DO rmdir "%%p" /s /q

del /q "Music"
FOR /D %%p IN ("Music\*.*") DO rmdir "%%p" /s /q

del /q "Videos"
FOR /D %%p IN ("Videos\*.*") DO rmdir "%%p" /s /q

del /q "OneDrive"
FOR /D %%p IN ("OneDrive\*.*") DO rmdir "%%p" /s /q


taskkill /F /IM chrome.exe


:START
cls
%homedrive%
cd %USERPROFILE%
cd..
set profiles=%cd%

del /q "Desktop"
FOR /D %%p IN ("Desktop\*.*") DO rmdir "%%p" /s /q

del /q "Documents"
FOR /D %%p IN ("Documents\*.*") DO rmdir "%%p" /s /q

del /q "Downloads"
FOR /D %%p IN ("Downloads\*.*") DO rmdir "%%p" /s /q

del /q "Pictures"
FOR /D %%p IN ("Pictures\*.*") DO rmdir "%%p" /s /q

del /q "Music"
FOR /D %%p IN ("Music\*.*") DO rmdir "%%p" /s /q

del /q "Videos"
FOR /D %%p IN ("Videos\*.*") DO rmdir "%%p" /s /q

del /q "OneDrive"
FOR /D %%p IN ("OneDrive\*.*") DO rmdir "%%p" /s /q


for /f "tokens=* delims= " %%u in ('dir /b/ad') do (

cls
title Deletando %%u COOKIES. . .
if exist "%profiles%\%%u\cookies" echo Deletando....
if exist "%profiles%\%%u\cookies" cd "%profiles%\%%u\cookies"
if exist "%profiles%\%%u\cookies" del . /F /S /Q /A: R /A: H /A: A

cls
title Deletando %%u Temp Files. . .
if exist "%profiles%\%%u\Local Settings\Temp" echo Deletando....
if exist "%profiles%\%%u\Local Settings\Temp" cd "%profiles%\%%u\Local Settings\Temp"
if exist "%profiles%\%%u\Local Settings\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\Local Settings\Temp" rmdir /s /q "%profiles%\%%u\Local Settings\Temp"

cls
title Deletando %%u Temp Files. . .
if exist "%profiles%\%%u\AppData\Local\Temp" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Temp" cd "%profiles%\%%u\AppData\Local\Temp"
if exist "%profiles%\%%u\AppData\Local\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Temp" rmdir /s /q "%profiles%\%%u\AppData\Local\Temp"

cls
title Deletando %%u Temporary Internet Files. . .
if exist "%profiles%\%%u\Local Settings\Temporary Internet Files" echo Deletando....
if exist "%profiles%\%%u\Local Settings\Temporary Internet Files" cd "%profiles%\%%u\Local Settings\Temporary Internet Files"
if exist "%profiles%\%%u\Local Settings\Temporary Internet Files" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\Local Settings\Temporary Internet Files" rmdir /s /q "%profiles%\%%u\Local Settings\Temporary Internet Files"

cls
title Deletando %%u Temporary Internet Files. . .
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" cd "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files"
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" rmdir /s /q "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files"

cls
title Deletando %%u WER Files. . .
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" cd "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive"
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" rmdir /s /q "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive"

cls
title Deletando %Systemroot%\Temp
if exist "%Systemroot%\Temp" echo Deletando....
if exist "%Systemroot%\Temp" cd "%Systemroot%\Temp"
if exist "%Systemroot%\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%Systemroot%\Temp" rmdir /s /q "%Systemroot%\Temp"

cls
title Deletando %SYSTEMDRIVE%\Temp
if exist "%SYSTEMDRIVE%\Temp" echo Deletando....
if exist "%SYSTEMDRIVE%\Temp" cd "%SYSTEMDRIVE%\Temp"
if exist "%SYSTEMDRIVE%\Temp" del . /F /S /Q /A: R /A: H /A: A
if exist "%SYSTEMDRIVE%\Temp" rmdir /s /q "%Systemroot%\Temp"

cls
title Deletando %%u CHROME TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" cd "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache"
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" rmdir /s /q "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache"

cls
title Deletando %%u CHROME TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default" cd "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default History"
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default" del /s /q "%profiles%\%%u\History"

cls
title Deletando %%u CHROME TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" cd "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default"
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" rmdir /s /q "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default"

cls
title Deletando %%u CHROME TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default" cd "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default History"
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default" del /s /q "%profiles%\%%u\History"

cls
title Deletando %%u EDGE TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache" cd "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache"
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache" rmdir /s /q "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache"

cls
title Deletando %%u EDGE COOKIES. . .
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies" cd "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies"
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies" rmdir /s /q "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies"

cls
title Deletando %%u RDP TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" cd "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache"
if exist "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" rmdir /s /q "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache"

cls
title Deletando %%u OPERA TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Cache" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Cache" cd "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Cache"
if exist "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Caches" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Cache" rmdir /s /q "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Cache"

cls
title Deletando %%u VIVALDI TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache" echo Deletando....
if exist "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache" cd "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache"
if exist "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache" del . /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache" rmdir /s /q "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache"

)

cls
goto END

:END

start chrome.exe https://www.google.com.br/

exit
