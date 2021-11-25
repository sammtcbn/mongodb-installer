@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set installpath=C:\mongodb

call mongodb-download-windows.bat

robocopy mongodb %installpath% /E

copy /Y "%currdir%\windows_service_create.bat" %installpath%
copy /Y "%currdir%\windows_service_delete.bat" %installpath%
copy /Y "%currdir%\windows_uninstall.bat" %installpath%
copy /Y "%currdir%\firewall_rule_add.bat" %installpath%
copy /Y "%currdir%\firewall_rule_del.bat" %installpath%
copy /Y "%currdir%\mongodb.config" %installpath%

mkdir C:\mongodb\log
mkdir C:\mongodb\data
mkdir C:\mongodb\data\db

call windows_service_create.bat
call firewall_rule_add.bat

:END
echo bye
timeout /t 3