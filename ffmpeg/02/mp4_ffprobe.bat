@echo off

::����Ҫ��ȡ��Ƶ��Ϣ���ļ�

set Video=H:\users\dos\ffmpeg\demo3.mp4
set savePath=H:\users\dos\ffmpeg\mp4info\

::��ȡĿ¼�¼���Ŀ¼�����е�mp4�ļ�·��
::(for /r %%i in (*.mp4) do echo %%i) >mp4_list.txt

::��ȡ����mp4����Ƶ��Ϣ������demo.txt�ļ�
::ffprobe.exe -v quiet -print_format json -show_format -show_streams %Video% >demo.txt 2>&1

::������ȡĿ¼�����е�mp4����Ƶ��Ϣ�����ڶ�Ӧ��txt�ļ��С�
set /a n=0
@echo off&setlocal enabledelayedexpansion
for /r %%i in (*.mp4) do (
::echo %%i
set /a n+=1&set "str=00000!n!"
set video=%%i
set filename=!video:~-15!
set filename=%%~nxi
echo !str:~-6!
::echo %%~nxi
ffprobe.exe -v quiet -print_format json -show_format -show_streams !Video! >!savePath!!filename!.txt 2>&1
) 
