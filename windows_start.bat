@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

C:\mongodb\bin\Mongod.exe --config C:\mongodb\mongodb.config --install
net start mongodb