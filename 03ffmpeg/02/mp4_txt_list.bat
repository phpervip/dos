::Find the file with the specified suffix in the specified directory
@echo off 
set /p Dir=Please enter the file directory to process(default is F:\mp4\mp4info)£º
::set /p Ext=Please enter the file suffix to find(default is mp4.txt)£º
if "%Dir%"=="" set Dir="F:\mp4\mp4info"
if "%Ext%"=="" set Ext=mp4.txt
pause
(for /r "%Dir%" %%i in (*.%Ext%) do echo %%i) >%Ext%_file_list.txt
echo "%Ext%"_file_list.txt OK

