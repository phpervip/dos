@echo off
title ����ʵ�ִ�����Ŀ¼
rem for dirname replace the first to the second 
set /p str1=please input the first string 
set /p str2=please input the second string 
setlocal enabledelayedexpansion
for /r %%i in (*.mp4) do (
::file absolute path
rem echo %%i
::file name
rem echo %%~nxi
::file dirname
rem echo %%~dpi
:: replace in dirname mp4\ to newmp4\ Ŀ¼�е� video\mp4�滻Ϊnew\mp4
set "newdir=%%~dpi"
set "str1=%str1%"
set "str2=%str2%"
set "newdir=!newdir:%str1%=%str2%!"
echo !newdir!
if not exist !newdir! mkdir !newdir!
)
echo complete
pause