rem netsh advfirewall firewall add rule name="mongodb" dir=in action=allow program="C:\mongodb\bin\mongod.exe" enable=yes
rem netsh advfirewall firewall add rule name="mongodb" dir=in action=allow protocol=TCP localport=27017

:end
