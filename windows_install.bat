@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set installpath=C:\mongodb

call mongodb-download-windows.bat
call database-tools-download-windows.bat

mongodb\bin\vcredist_x64.exe /install /norestart /qn /passive

robocopy mongodb %installpath% /E

copy /Y "%currdir%\windows_start.bat" %installpath%
copy /Y "%currdir%\windows_start_public.bat" %installpath%
copy /Y "%currdir%\windows_stop.bat" %installpath%
copy /Y "%currdir%\windows_stop_public.bat" %installpath%
copy /Y "%currdir%\windows_uninstall.bat" %installpath%
copy /Y "%currdir%\mongodb.config" %installpath%
copy /Y "%currdir%\mongodb_public.config" %installpath%

mkdir C:\mongodb\log
mkdir C:\mongodb\data
mkdir C:\mongodb\data\db

xcopy /Y /E database-tools\bin\* %installpath%\bin
copy /Y database-tools\LICENSE.md %installpath%\database-tools-LICENSE.md
copy /Y database-tools\README.md %installpath%\database-tools-README.md
copy /Y database-tools\THIRD-PARTY-NOTICES %installpath%\database-tools-THIRD-PARTY-NOTICES


:END
echo bye
timeout /t 3
