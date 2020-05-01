title batch create filelist
setlocal enabledelayedexpansion
%~d0
cd %~dp0
if exist filelist.txt del filelist.txt
for /R %%s in (.,*) do (
echo %%s
) >>filelist.txt
