
    @echo off
    title �����滻�ļ�(�ļ���)��
    echo ��������������滻���ļ������ļ����������ļ�(�ļ���)����
    echo.
    set /p str1= ������Ҫ�滻���ļ�(�ļ���)���ַ��������滻�ո񣩣�
    set /p str2= �������滻����ļ�(�ļ���)���ַ�����ȥ����ֱ�ӻس�����
    echo.
    echo �����滻�ļ�(�ļ���)������
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
    echo ���
    pause
