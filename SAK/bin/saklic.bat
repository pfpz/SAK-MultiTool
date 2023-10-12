@echo off
:home
set /p passfile=<C:\SAK\bin\accountinfo\pass.txt
set /p userfile=<C:\SAK\bin\accountinfo\user.txt
set /p datefile=<C:\SAK\bin\accountinfo\datecreated.txt
set /p ipfile=<C:\SAK\bin\accountinfo\ip.txt
title SAK Login Creator
cls
color 0a
cls
echo Create an account now if this is your first time or make a new account! (E)xit \ (S)AK
echo -------------------------------------------------------------------------------------------
set /p choice=Do you want to (C)reate a new account, (D)elete an account,or see account (I)nfo?: 
if %choice%==c goto accountcreate
if %choice%==d goto accountdelete
if %choice%==e exit
if %choice%==i goto accinfo
if %choice%==s call C:\SAK\SAKMultiTool.bat

:accountcreate
if exist C:\SAK\bin\accountinfo\user.txt goto createfail
if not exist C:\SAK\bin\accountinfo\user.txt goto accountcreate1

:createfail
cls
start C:\SAK\bin\ace.vbs
goto home

:accountcreate1
cls
echo Create a new account below!
set /p user=Enter username: 
set /p pass=Enter password: 
echo %user% > C:\SAK\bin\accountinfo\user.txt
echo %pass% > C:\SAK\bin\accountinfo\pass.txt
echo %date% > C:\SAK\bin\accountinfo\datecreated.txt
for /f "tokens=2 delims=:" %%a in ('ipconfig^|find "IPv4 Address"') do (
set ip=%%a
goto :BREAK
)

:BREAK
echo %ip: =% >C:\SAK\bin\accountinfo\ip.txt
goto done

:accountdelete
cls
echo Delete your account below!
set /p delete=Are you sure you want to delete your account? (Y or N): 
if %delete%==y goto deleted
if %delete%==n goto home

:deleted
cls
if exist C:\SAK\bin\accountinfo\user.txt goto delaccnow
if not exist C:\SAK\bin\accountinfo\user.txt goto errordel


:delaccnow
cls
del C:\SAK\bin\accountinfo\user.txt
del C:\SAK\bin\accountinfo\pass.txt
del C:\SAK\bin\accountinfo\datecreated.txt
goto sucdel



:errordel
cls
color c0
start C:\SAK\bin\delerror.vbs
echo There was an issue with your deletion, please try again..
pause
goto home

:sucdel
cls
color a0
echo Deletion successful, return home now..
pause
goto home


:done
cls
color a0
echo Account created! 
set /p choice2=(1)Open sak or (2)Go home?: 
if %choice2%==1 call C:\SAK\SAKMultiTool.bat
if %choice2%==2 goto home
goto home

:accinfo
cls
color 0c
if exist C:\SAK\bin\accountinfo\pass.txt (
echo Account info is displayed below
echo Username: %userfile%
echo Password: %passfile%
echo Date created: %datefile%
echo IP Associated to account: %ipfile%
pause
goto home) else echo There is currently no account created on this device, create
echo an account now and try again
timeout /t 5
goto home

