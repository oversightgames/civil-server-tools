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
if %%a==CUSTOM_SEED set CUSTOM_SEED=%%b
    echo(!OUTPUT_SERVER_LOG!!GLOBAL_GRAVITY!!CUSTOM_SEED!
    ENDLOCAL
)>>Config.civ

cd ..\PlayerData\
break>Database.civ
for /f "tokens=1,2 delims==" %%a in (database.ini) do (
SETLOCAL EnableDelayedExpansion
if %%a==MYSQL_SERVER_NAME set MYSQL_SERVER_NAME=%%b
if %%a==MYSQL_USERNAME set MYSQL_USERNAME=%%b
if %%a==MYSQL_PASSWORD set MYSQL_PASSWORD=%%b
if %%a==MYSQL_DB_NAME set MYSQL_DB_NAME=%%b
    echo(!MYSQL_SERVER_NAME!!MYSQL_USERNAME!!MYSQL_PASSWORD!!MYSQL_DB_NAME!
    ENDLOCAL
)>>Database.civ
@echo off



:: Deploying Config Files
echo ======Deploying Config======
@echo on
:: xcopy /s /y ..\Plugins\*.* %location%\civil\Content\Paks
move Database.civ %location%
cd ../
cd ServerConfig
move Config.civ %location%

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