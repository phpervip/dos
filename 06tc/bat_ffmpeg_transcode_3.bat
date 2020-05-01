@echo off
title batch ffmpeg video transcode
setlocal enabledelayedexpansion
::suggest note the transcoding code first to see if the directiory success create
rem for dirname replace the first to the second 

set "str1=D:\mp4\himp4"
set "str2=D:\mp4\180k"
set "str3=D:\mp4\log"
set savefile="result2.txt"
set /a n=0
echo start...
set starttime=%time%
echo starttime:%starttime%>%savefile%
::setlocal enabledelayedexpansion
for /r d:\mp4\himp4\ %%i in (*.mp4) do (
call set t1=%%time%%
echo %%~nxi
set /a n+=1&set "str=0000!n!"
echo !str:~-6!
set "olddir=%%~dpi"
set "str1=%str1%"
set "str2=%str2%"
set "str3=%str3%"
::echo %str1%
::echo %str2%
::echo %str3%
::echo !olddir!
set "newdir=!olddir:%str1%=%str2%!"
set "logdir=!olddir:%str1%=%str3%!"
if not exist !newdir! mkdir !newdir!
if not exist !logdir! mkdir !logdir!
rem echo !newdir!
rem echo !logdir!
rem echo !logdir!%%~ni_1.logs
rem echo !newdir!%%~ni.mp4
echo waiting...
::ping /n 3 127.1>nul
rem goto :outfor
C:\ffmpeg.exe -y -i %%i -c:v libx265 -b:v 180k -x265-params pass=1 -c:a aac -b:a 48k -f mp4 NUL 2>!logdir!%%~ni_1.log
echo pass 1 ok
C:\ffmpeg.exe -y -i %%i -c:v libx265 -b:v 180k -x265-params pass=2 -c:a aac -b:a 48k !newdir!%%~ni.mp4 2>!logdir!%%~ni_2.log
echo pass 2 ok
call set t2=%%time%%
call echo %%~nxi,%%t1%%,%%t2%% >>%savefile%
)

:outfor
echo endtime:%time%>>%savefile%
echo complete
pause