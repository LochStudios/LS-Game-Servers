@echo off
:handles
Color 6
set IP=10.10.10.242
set folder=GameServers
set server-folder=\\%IP%\%folder%\
set server-map=Z:
set installed=
set V=A1
set name=Backup Servers %V%
title %name%
cls
goto start

:failed
echo.
echo I can not find the mapped Z drive on this server,
echo please make sure the server has the Z drive mapped to:
echo.
echo %server-folder%
echo.
pause
exit

:start
IF EXIST "%server-map%\mapped.txt" (echo Backing Up!) ELSE (goto failed)
REM In. -- Make Folders
MD %server-map%\servers\%date:~10%
MD %server-map%\servers\%date:~10%\%date:~7,2%
MD %server-map%\servers\%date:~10%\%date:~7,2%\%date:~4,2%
cls
REM Out. -- Make Folders
XCOPY "*"/S /R /V /Y /D /Z /C "%server-map%\servers\%date:~10%\%date:~7,2%\%date:~4,2%\"
pause
type NUL > %server-map%\logs\backup-finished--%date:~4,2%-%date:~7,2%-%date:~-2,2%.txt
echo Backup Finished at %time:~0,-6%
pause