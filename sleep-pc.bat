@echo off
echo ============================================
echo =========== System Sleep     ===============
echo ============================================

echo Specify Time (minutes):
SET /p SEC=
IF NOT DEFINED SEC SET "SEC=0"
SET /A SEC *= 60

if /i not ""%SEC%"" == ""0"" goto timerStart
SET /A SEC=5

:timerStart

echo Sleep PC after %SEC% seconds? (y/n):
set /p answer=
if /i ""%answer%"" == ""y"" goto exec
goto end

:exec

echo TIME: %time%
echo PC will sleep after %SEC% seconds

TIMEOUT /T %SEC% /NOBREAK

rem if winamp is running - pause it
rem "%ProgramFiles%\Winamp\CLAmp.exe" /PAUSE
rem "%ProgramFiles%\Winamp\CLAmp.exe" /STOPFADE

echo Sleeping...

rundll32.exe powrprof.dll,SetSuspendState 0,1,0

goto end

:end