@echo off 
(for /f "tokens=*" %%i in ('dir/s/b/tc') do echo %%~nxi,%%~dpi,%%~zi)>list2.txt