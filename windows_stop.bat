@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

net stop mongodb
C:\mongodb\bin\Mongod.exe --remove