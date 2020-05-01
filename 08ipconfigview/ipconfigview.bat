COLOR 0A
CLS
@ECHO Off
Title Query online computers in LAN
:send
@ECHO off&setlocal enabledelayedexpansion

ECHO Getting IP address of this machine, please wait
for /f "tokens=3 skip=2 delims=: " %%i in ('nbtstat -n') do (
set "IP=%%i"
set IP=!IP:~1,-1!
ECHO this Computer IPis:!IP!
goto :next
)

:next
for /f "delims=. tokens=1,2,3,4" %%i in ("%IP%") do set range=%%i.%%j.%%k
ECHO.&ECHO Getting other online computer names in this network segment, please wait...
ECHO The computers in this network segment are[%range%.*]
for /f "delims=" %%i in ('net view') do (
set "var=%%i"
::Query online computer name
if "!var:~0,2!"=="\\" (
set "var=!var:~2!"
ECHO !var!
ping -n 1 !var!>nul
))
ECHO.
ECHO Getting other online computer IP in this network segment, please wait a moment...
for /f "skip=3 tokens=1,* delims= " %%i in ('arp -a') do ECHO IP: %%i is in use

ECHO.
ECHO After query, press any key to exit...
pause>nul