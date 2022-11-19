@echo off

SET NAME="Wi-Fi"

echo Reseting %NAME% DNS Servers to auto

TIMEOUT /T 3 /NOBREAK

netsh interface ip set dnsservers name = %NAME% source=dhcp
rem netsh interface ip set dnsservers name = "Wi-Fi" source=dhcp

echo Reset %NAME% DNS Servers - done

TIMEOUT /T 2 /NOBREAK