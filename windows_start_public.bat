@echo off
set currdir=%~dp0
IF "%currdir:~-1%"=="\" SET currdir=%currdir:~0,-1%
cd /d "%currdir%"

C:\mongodb\bin\Mongod.exe --config C:\mongodb\mongodb_public.config --install
net start mongodb

netsh advfirewall firewall add rule name="mongodb" dir=in action=allow program="C:\mongodb\bin\mongod.exe" enable=yes
rem netsh advfirewall firewall add rule name="mongodb" dir=in action=allow protocol=TCP localport=27017