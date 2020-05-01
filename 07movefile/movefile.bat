@echo off & title 匹配前七位字符 By 依梦琴瑶

for /d %%a in (*) do (
    call :MOVEFILE "%%~a"
)
pause
exit

:MOVEFILE
set "Str=%~1"
for %%b in ("%Str:~,7%*") do (
    if not exist "%~1\%%~nxb" (
        move "%%~b" "%~1\" >nul 2>nul && (
            echo "%%~nxb" 被移动至 "%~nx1" 中
        ) || (
            echo "%%~nxb" 移动失败
        )
    )
)
goto :eof
