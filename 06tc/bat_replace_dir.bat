
    @echo off
    title 批量替换文件(文件夹)名
    echo 此批处理可批量替换本文件所在文件夹下所有文件(文件夹)名。
    echo.
    set /p str1= 请输入要替换的文件(文件夹)名字符串（可替换空格）：
    set /p str2= 请输入替换后的文件(文件夹)名字符串（去除则直接回车）：
    echo.
    echo 正在替换文件(文件夹)名……
    for /f "delims=" %%a in ('dir /s /b ^|sort /+65535') do (
    if "%%~nxa" neq "%~nx0" (
    set "file=%%a"
    set "name=%%~na"
    set "extension=%%~xa"
    call set "name=%%name:%str1%=%str2%%%"
    setlocal enabledelayedexpansion
    ren "!file!" "!name!!extension!" 2>nul
    endlocal
    )
    )
    echo 完成
    pause
