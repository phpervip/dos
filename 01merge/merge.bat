@echo off&setlocal enabledelayedexpansion
for /f "delims=" %%a in ('dir /a-d /b') do (
set "folder=%%~a"
set "folder=!folder:~0,6!"
echo "%folder%"
if not exist !folder! mkdir !folder!
move "%%~a" "!folder!"
)
pause