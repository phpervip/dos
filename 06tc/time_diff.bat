@echo off
set "t1=24:20:35"
set "t2=24:20:20"
call :time_to_sec %t1% t1
call :time_to_sec %t2% t2
set/a t3=%t1%-%t2%
echo;%t3%
  
pause&exit
  
:time_to_sec (输入时间，返回秒)
setlocal&for /f "tokens=1-3 delims=:" %%a in ("%1") do set/a t=(%%a*60+%%b)*60+%%c
endlocal&set "%2=%t%"&goto:eof