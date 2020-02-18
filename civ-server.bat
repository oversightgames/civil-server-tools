:: Copyright Oversight Games - All Rights Reserved
:: Ensure the directory below is correct before launching!
@echo off
SET location=G:\civilthegame-master\compile\WindowsServer

:: Check Directory

if exist %location%\civilServer.exe (

:: Begin Config Deployment
echo Deploying Config

cd ServerConfig

for /f "tokens=1,2 delims==" %%a in (server-info.ini) do (
SETLOCAL EnableDelayedExpansion
if %%a==NAME set NAME=%%b
if %%a==DESCRIPTION set DESCRIPTION=%%b
    echo(!NAME!!DESCRIPTION!
    ENDLOCAL
)



:: Packaging Config Files
echo Packaging Config
cd..
pause

) else (
echo Directory invalid.
pause
)