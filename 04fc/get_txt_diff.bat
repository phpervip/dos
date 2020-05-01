@echo off 
set /p File1=Please enter this first filename(default is files1.txt)£º
if "%File1%"=="" set File1="filemd51.txt"
set /p File2=Please enter this second filename(default is files2.txt)£º
if "%File2%"=="" set File2="files2.txt"

fc %File1% %File2%>diff.txt
if errorlevel 1 (
echo find diff ... 
pause exit
) 
echo ok

