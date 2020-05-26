:: Copyright Oversight Games - All Rights Reserved
:: Ensure the directory below is correct before launching!
@echo off
SET "location=C:\Program Files\Steam\steamapps\common\Civil Dedicated Server"
:: Erase "-log" to run server in background.
SET params=-log

:: Check Directory

if exist "%location%\civilServer.exe" (

:: Deploying Config Files
echo ======Deploying Config======
@echo on
:: xcopy /s /y ".\Plugins\*.*" "%location%\civil\Content\Paks"
xcopy /s /y ".\PlayerData\*.*" "%location%\civil"
xcopy /s /y ".\ServerConfig\*.*" "%location%\civil"

echo ............................

:: Running Dedicated Server
echo ======Starting Server======
start "" "%location%\civilServer.exe" %params%
@echo off
) else (
echo Error: Directory invalid.
pause
)

:: Window should close without errors.

