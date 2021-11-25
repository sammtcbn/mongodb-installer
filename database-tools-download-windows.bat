@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

set dlver=100.5.1
set dlfile=mongodb-database-tools-windows-x86_64-%dlver%.zip
set dlurl=https://fastdl.mongodb.org/tools/db/%dlfile%
set foldername=mongodb-database-tools-windows-x86_64-%dlver%

curl --fail --output %dlfile% -L %dlurl%
if %errorlevel% neq 0 (
    echo Fail to download %dlfile%
    pause
    goto End
)

if not exist %dlfile% (
    echo %dlfile% not found
    pause
    goto End
)

powershell -command "Expand-Archive -Force %dlfile% ."

if not exist %foldername%\bin\mongodump.exe (
    echo Fail to extract %dlfile%
    pause
    goto End
)

rename %foldername% database-tools

:END
echo bye
timeout /t 3
