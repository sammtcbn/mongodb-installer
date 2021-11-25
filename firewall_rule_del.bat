rem netsh advfirewall firewall delete rule name="mongodb" program="C:\mongodb\bin\mongod.exe"
rem netsh advfirewall firewall delete rule name="mongodb" protocol=TCP localport=27017

:end

