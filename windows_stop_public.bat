@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

netsh advfirewall firewall delete rule name="mongodb" program="C:\mongodb\bin\mongod.exe"
rem netsh advfirewall firewall delete rule name="mongodb" protocol=TCP localport=27017

net stop mongodb
C:\mongodb\bin\Mongod.exe --remove