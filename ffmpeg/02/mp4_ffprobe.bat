@echo off

::设置要获取视频信息的文件

set Video=H:\users\dos\ffmpeg\demo3.mp4

set /p savePath=Please enter the file directory to process(default is F:\mp4\mp4info\)：
if "%savePath%"=="" set Dir="F:\mp4\mp4info\"

if exist %savePath% (
    echo %savePath% is exist
) else (
   echo create %savePath%
   md %savepath%
)

::获取目录下及子目录下所有的mp4文件路径
::(for /r %%i in (*.mp4) do echo %%i) >mp4_list.txt

::获取单个mp4的视频信息保存在demo.txt文件
::ffprobe.exe -v quiet -print_format json -show_format -show_streams %Video% >demo.txt 2>&1

::批量获取目录下所有的mp4的视频信息保存在对应的txt文件中。
set /a n=0
@echo off&setlocal enabledelayedexpansion
for /r %%i in (*.mp4) do (
::echo %%i
set /a n+=1&set "str=00000!n!"
set video=%%i
::set filename=!video:~-15!
set filename=%%~nxi
echo !str:~-6!
::echo %%~nxi
ffprobe.exe -v quiet -print_format json -show_format -show_streams !Video! >!savePath!!filename!.txt 2>&1
) 
pause
