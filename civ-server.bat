:: Copyright Oversight Games - All Rights Reserved
:: Ensure the directory below is correct before launching!
@echo off
SET location=G:\civilthegame-master\compile\WindowsServer
:: Erase "-log" to run server in background.
SET params=-log

:: Check Directory

if exist %location%\civilServer.exe (

:: Packaging Config Files
echo ====Packaging Config=====

@echo on

cd ServerConfig
break>Config.civ
for /f "tokens=1,2 delims==" %%a in (server-info.ini) do (
SETLOCAL EnableDelayedExpansion
if %%a==NAME set NAME=%%b
if %%a==DESCRIPTION set DESCRIPTION=%%b
if %%a==ICON set ICON=%%b
if %%a==MAX_PLAYERS set MAX_PLAYERS=%%b
if %%a==WORLD set WORLD=%%b
if %%a==GAMEMODE set GAMEMODE=%%b
    echo(!NAME!!DESCRIPTION!!ICON!!MAX_PLAYERS!!WORLD!!GAMEMODE!
    ENDLOCAL
)>>Config.civ

for /f "tokens=1,2 delims==" %%a in (preferences.ini) do (
SETLOCAL EnableDelayedExpansion
if %%a==OUTPUT_SERVER_LOG set OUTPUT_SERVER_LOG=%%b
if %%a==GLOBAL_GRAVITY set GLOBAL_GRAVITY=%%b
    echo(!OUTPUT_SERVER_LOG!!GLOBAL_GRAVITY!
    ENDLOCAL
)>>Config.civ

@echo off



:: Deploying Config Files
echo ======Deploying Config======
@echo on
:: xcopy /s /y ..\Plugins\*.* %location%\civil\Content\Paks
move Config.civ %location%
xcopy /s /y ..\PlayerData\*.* %location%

echo ............................


:: Running Dedicated Server
echo ======Starting Server======
start %location%\civilServer.exe %params%
@echo off
) else (
echo Error: Directory invalid.
pause
)


:: Window should close without errors.