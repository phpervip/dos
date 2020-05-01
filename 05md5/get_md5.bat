@echo off
title batch create md5
set /p TXT=Please enter this filelist txt filename(default is filelist.txt)：
if "%TXT%"=="" set TXT="filelist.txt"
set starttime=%time%
if exist filemd5.txt del filemd5.txt
set /a n=0
setlocal enabledelayedexpansion
::两种写法都可以
for /f "usebackq skip=1" %%a in (%TXT%) do (
::for /f "skip=1 delims=" %%a in ('type "%TXT%"') do (
set /a n+=1&set "str=0000!n!"
echo !str:~-6!
echo %%a
certutil -hashfile "%%a" MD5>>filemd5.txt
)

echo start time: %starttime%
echo end time: %time%

echo complete!
pause