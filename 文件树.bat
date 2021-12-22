@echo off
setlocal enabledelayedexpansion
:loop
set /p folder=拖入文件目录
set "folder=%folder:"=%"
cd /d "%folder%" ||goto loop
(echo;		本文档统计于%date:~0,-3% & echo.)>Files_Tree_look2.txt
for /f "delims=[]" %%a in ('dir /s^|find "" /n /v^|find "所列文件总数"') do ( set /a num=%%a
set /a wj=!num!+1 & set /a ml=!num!+2
for /f "tokens=2 delims= " %%b in ('dir /s^|find "" /n /v^|find "[!wj!]"') do set files=%%b
for /f "tokens=2 delims= " %%c in ('dir /s^|find "" /n /v^|find "[!ml!]"') do set folders=%%c
echo;%cd%  【!files!个文件!folders!个目录】&echo. )>>Files_Tree_look2.txt
for /f "delims=" %%d in ('dir /ad /b') do ( echo;	%%d
pushd "%%~d"
for /f "delims=" %%h in ('dir /ogn /s /b') do ( echo;		%%h  【%%~zh 】 )
popd )>>Files_Tree.txt
for /f "delims=" %%i in ('dir /a-d /b') do ( echo;	%%i  【%%~zi】 )>>Files_Tree_look2.txt
echo;完毕&pause>nul