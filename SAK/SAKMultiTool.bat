@echo off


:home
echo %ipfile% opened SAK on %date%%time% >C:\SAK\bin\logs\startlog%lognum%\startlog%lognum%.txt
set /p datefile=<C:\SAK\bin\accountinfo\datecreated.txt
set /p ipfile=<C:\SAK\bin\accountinfo\ip.txt
if not exist C:\SAK\bin\accountinfo mkdir C:\SAK\bin\accountinfo
if not exist C:\SAK\bin\logs mkdir C:\SAK\bin\logs 
if exist C:\SAK\bin\logs\s.txt del C:\SAK\bin\logs\s.txt
if exist C:\SAK\bin\accountinfo\d.txt del C:\SAK\bin\accountinfo\d.txt
set lognum=SSID%random%%random%
cls
powershell -window normal -command ""
title SAK BETA 0.4.4 // @pfpz
color c0
echo ________________________________________________________________
echo _____/\\\\\\\\\\\_______/\\\\\\\\\_____/\\\________/\\\_________        
echo ____/\\\/////////\\\___/\\\\\\\\\\\\\__\/\\\_____/\\\//_________      
echo ____\//\\\______\///___/\\\/////////\\\_\/\\\__/\\\//___________      
echo ______\////\\\_________\/\\\_______\/\\\_\/\\\\\\//\\\__________     
echo __________\////\\\______\/\\\\\\\\\\\\\\\_\/\\\//_\//\\\________    
echo ______________\////\\\___\/\\\/////////\\\_\/\\\____\//\\\______   
echo ________/\\\______\//\\\__\/\\\_______\/\\\_\/\\\_____\//\\\____  
echo ________\///\\\\\\\\\\\/___\/\\\_______\/\\\_\/\\\______\//\\\__ 
echo ___________\///////////_____\///________\///__\///________\///__
echo ________________________________________________________________
echo    Please login using the message boxes that have been opened:     
echo ________________________________________________________________ 
mkdir C:\SAK\bin\logs\startlog%lognum%
if not exist C:\SAK\bin\accountinfo\user.txt goto startfail
goto home2

:startfail
mkdir C:\SAK\bin\logs\faillog%lognum%
echo %ipfile% failed a start due to no account on %date%%time% >C:SAK\bin\logs\faillog%lognum%\faillog%lognum%.txt
powershell -window normal -command ""
start C:\SAK\bin\starterror.vbs
if not exist C:\SAK\bin\accountinfo mkdir C:\SAK\bin\accountinfo
if not exist C:\SAK\bin\logs mkdir C:\SAK\bin\logs
goto accountcreate 

:home2
set /p passfile=<C:\SAK\bin\accountinfo\pass.txt
set /p userfile=<C:\SAK\bin\accountinfo\user.txt
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; Add-Type -AssemblyName System.Windows.Forms; [Microsoft.VisualBasic.Interaction]::InputBox('Enter your username:', 'SAK BETA 0.4.4 Login', ''); $mainForm.Controls.Add($lbl); $mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen; $mainForm.ShowDialog()}" > %TEMP%\user.tmp 
set /p user=<%TEMP%\user.tmp                                                                                             
if not %user%==%userfile% goto fail
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; Add-Type -AssemblyName System.Windows.Forms; [Microsoft.VisualBasic.Interaction]::InputBox('Enter your password:', 'SAK BETA 0.4.4 Login'); $mainForm.Controls.Add($lbl); $mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen; $mainForm.ShowDialog()}" > %TEMP%\pass.tmp 
set /p pass=<%TEMP%\pass.tmp 
if not %pass%==%passfile% goto fail 
for /f "tokens=2 delims=:" %%a in ('ipconfig^|find "IPv4 Address"') do (
set ip=%%a
goto BREAK2
)

:BREAK2
mkdir C:\SAK\bin\logs\goodlog%lognum%
echo %ip: =% logged in on %date%%time% with username %user% and password %pass% >C:\SAK\bin\logs\goodlog%lognum%\goodlog%lognum%.txt
goto menu



:loggedout
cls
mkdir C:\SAK\bin\logs\startlog%lognum%
echo %ipfile% logged out of %userfile% on %date%%time% >C:\SAK\bin\logs\startlog%lognum%\startlog%lognum%.txt
powershell -window normal -command ""
echo You are now logged out of %userfile%...
timeout /t 3 /nobreak
goto home

:fail
cls
powershell -window minimized -command ""
cls
for /f "tokens=2 delims=:" %%a in ('ipconfig^|find "IPv4 Address"') do (
set ip=%%a
goto BREAK
)

:BREAK
mkdir C:\SAK\bin\logs\badlog%lognum%
echo %ip: =% failed a log in on %date%%time% with username %user% and password %pass% >C:\SAK\bin\logs\badlog%lognum%\badlog%lognum%.txt
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Your login has failed. Press Ok to retry or Cancel to close SAK. If error persists contact @pfpz', 'Login error: ', 'OkCancel', [System.Windows.Forms.MessageBoxIcon]::Warning; $mainForm.Controls.Add($lbl); $mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen; $mainForm.ShowDialog()}" > %TEMP%\out45.tmp
set /p OUT45=<%TEMP%\out45.tmp
if %OUT45%==OK goto home
if %OUT45%==Cancel exit
if %OUT45%==X exit
timeout /t 1 /nobreak
goto home

:menu
cls
powershell -window normal -command ""
color c0
mode con:cols=100 lines=30
title SAK BETA 0.4.4 Directory // @pfpz
echo.     SSID (Session ID):  // Use this to identify which log is for which session
echo.     %lognum% // Current User: %userfile%
echo. ----------------------------------------------------------------------------------------
echo.  !!!!!!!!!!!!!!!!!!!!! SAK Multi Tool (Swiss army knife) is a tool !!!!!!!!!!!!!!!!!!!!
echo.  !  Swiss Army Knife ! coded in batch for Windows based devices    ! Swiss Army Knife !
echo.  !     Multi Tool    ! to help in Network based white hat hacking  !     Multi Tool   !
echo.  !    Made by @pfpz  ! and pen testing. SAK can also be used for   !   Made by @pfpz  !
echo.  !!!!!!!!!!!!!!!!!!!!! many more educational uses! Check it out:   !!!!!!!!!!!!!!!!!!!!
echo. ----------------------------------------------------------------------------------------
echo.  Please select a Tool you would like to use down below !! Follow TikTok @pfpz for more!
echo. -----------------------------------------------------------------------------------------
echo.      [RAINBOW Pinger] - 1 // [IP Tracker] - 2 // [Wifi Recovery] - 3 // [Logout] - 4 
echo. -----------------------------------------------------------------------------------------
echo.            [Browser] - 5 // [Exit] - 6 // [News] - 7 // [Account Manager] - 8
echo.
set /p menuans=Directory selection: 
if %menuans%==1 goto rainbowp
if %menuans%==2 goto tracker
if %menuans%==3 goto wifirec
if %menuans%==4 goto loggedout
if %menuans%==5 goto browser
if %menuans%==6 exit 
if %menuans%==7 goto newstab
if %menuans%==8 goto homesaklic
if %menuans%==123 goto menu

:newstab
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Major bug fixes and feedback control fixes. Major UI and GUI changes. Stay up to date with all new features and updates by following my TikTok @pfpz', 'SAK BETA 0.4.4 News & Patch Notes', 'OK'); [System.Windows.Forms.MessageBoxIcon]::Information; $mainForm.Controls.Add($lbl); $mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen; $mainForm.ShowDialog()}" > %TEMP%\out96.tmp
set /p out96=<%TEMP%\out96.tmp
if %out96%==OK goto menu
if %out96%==X goto menu

:rainbowp
cls
color 0c
title SAK BETA 0.4.4 RAINBOW Pinger! // @pfpz
mode con:cols=100 lines:60 
echo !!!!!!!!!!!!!!!!!!!!! 
echo !  Swiss Army Knife !
echo !     Multi Tool    !
echo !    Made by @pfpz  !
echo !!!!!!!!!!!!!!!!!!!!! PRESENTS:
echo --------------------------------------------------------------------------------
echo RAINBOW Pinger!
echo Enter any IP or address below and behold as the rainbowness takes you away!
echo --------------------------------------------------------------------------------
set /p IP=Enter your target's IP: 
goto pinger

:pinger
cls
mode con:cols=60 lines=40
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline. 
IF not ERRORLEVEL 1 echo Your Target %ip% is online.
ping -t 2 0 10 127.0.0.1 >nul
color a
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online.
ping -t 2 0 10 127.0.0.1 >nul
color 02
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online. 
ping -t 2 0 10 127.0.0.1 >nul
color 03
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online. 
ping -t 2 0 10 127.0.0.1 >nul
color 04
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online.
ping -t 2 0 10 127.0.0.1 >nul
color 05
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online.
ping -t 2 0 10 127.0.0.1 >nul
color 06
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online. 
ping -t 2 0 10 127.0.0.1 >nul
color 07
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online. 
ping -t 2 0 10 127.0.0.1 >nul
color 08
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online. 
ping -t 2 0 10 127.0.0.1 >nul
color 09
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online.
ping -t 2 0 10 127.0.0.1 >nul
color 0a
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online.
ping -t 2 0 10 127.0.0.1 >nul
color 0b
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online.
ping -t 2 0 10 127.0.0.1 >nul
color 0c
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online.
ping -t 2 0 10 127.0.0.1 >nul
color 0d
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online.
ping -t 2 0 10 127.0.0.1 >nul
color 0e
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online.
ping -t 2 0 10 127.0.0.1 >nul
color 0f
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 echo Your target %ip% is offline.
IF not ERRORLEVEL 1 echo Your Target %ip% is online.
ping -t 2 0 10 127.0.0.1 >nul
goto pinger

:tracker
cls
color c0
mode con:cols=60 lines:40 
title SAK BETA 0.4.4 IP Tracker // @pfpz
echo !!!!!!!!!!!!!!!!!!!!!
echo !  Swiss Army Knife !
echo !     Multi Tool    !
echo !    Made by @pfpz  !
echo !!!!!!!!!!!!!!!!!!!!! PRESENTS:
echo ------------------------------------------------------
echo IP Tracker BETA 2.0 (Powered by ipinfo.io)
echo ------------------------------------------------------
set /p trackd=Enter your target's IP: 
goto tracked

:tracked
cls
color 0c
mode con:cols=80 lines:40 
title SAK BETA 0.4.4 IP Tracker // @pfpz
echo !!!!!!!!!!!!!!!!!!!!!
echo !  Swiss Army Knife !
echo !     Multi Tool    !
echo !    Made by @pfpz  !
echo !!!!!!!!!!!!!!!!!!!!! PRESENTS:
echo ----------------------------------------------------------------------------------
echo IP Tracker BETA 1.1 (Powered by ipinfo.io)
echo ----------------------------------------------------------------------------------
echo Your target's information has been gathered at ipinfo.io/%trackd%
echo ----------------------------------------------------------------------------------
set /p tracked2=Do you wish to track another IP (1) or go back to the directory (2)?: 
if %tracked2%==1 goto tracker
if %tracked2%==2 goto menu

:wifirec
cls
title SAK BETA 0.4.4 Wifi Recovery // @pfpz
echo !!!!!!!!!!!!!!!!!!!!!
echo !  Swiss Army Knife !
echo !     Multi Tool    !
echo !    Made by @pfpz  !
echo !!!!!!!!!!!!!!!!!!!!! PRESENTS:
echo ---------------------------------------------------------------------------------------
mode con:cols=140 lines=40
echo Welcome to SAK Wifi Recovery! Here is a list of your saved wifi networks and passwords:
echo ---------------------------------------------------------------------------------------
setlocal enabledelayedexpansion

for /F "tokens=2 delims=:" %%a in ('netsh wlan show profile') do (
    set wifi_pwd=
    for /F "tokens=2 delims=: usebackq" %%F IN (`netsh wlan show profile %%a key^=clear ^| find "Key Content"`) do (
        set wifi_pwd=%%F
    )
    echo %%a : !wifi_pwd!       // 
)
echo ---------------------------------------------------------------------------------------
echo (d)irectory or (e)xit
echo ---------------------
set /p redirect=Where to now?: 
if %redirect%==d goto menu
if %redirect%==e exit

:browser
cls
color 90
title SAK.SBB (Browser) // @pfpz
echo !!!!!!!!!!!!!!!!!!!!!
echo !  Swiss Army Knife !
echo !     Multi Tool    !
echo !    Made by @pfpz  !
echo !!!!!!!!!!!!!!!!!!!!! PRESENTS:
echo ------------------------------------------------------------
echo Welcome to SAK Smart Batch Browser, or SAK.SBB for short!
echo ------------------------------------------------------------
echo Enter (D) for directory or (E) to exit!
echo ------------------------------------------------------------
set /p browserq=What would you like to look up?: 
if %browserq%==e exit 
if %browserq%==d goto menu
goto browserdone

:browserdone
cls
color 90
title SAK.SBB (Browser) // @pfpz
echo !!!!!!!!!!!!!!!!!!!!!
echo !  Swiss Army Knife !
echo !     Multi Tool    !
echo !    Made by @pfpz  !
echo !!!!!!!!!!!!!!!!!!!!! PRESENTS: 
echo -------------------------------------------------------------------------------
echo Welcome to SAK Smart Batch Browser, or SAK.SBB for short!
echo -------------------------------------------------------------------------------
echo Now redirecting you to http://www.google.pt/search?q=%browserq%...
echo -------------------------------------------------------------------------------
>nul chcp 65001
set "_spc=          "
set "_bar=■■■■■■■■■■"

setlocal enabledelayedexpansion

for /f %%a in ('copy /Z "%~dpf0" nul')do for /f skip^=4 %%b in ('echo;prompt;$H^|cmd')do set "BS=%%~b" & set "CR=%%a"
for /l %%L in (1 1 10)do <con: set /p "'= !CR!!BS!!CR![!_bar:~0,%%~L!!BS!!_spc:~%%~L!] " <nul & >nul timeout.exe /t 1 /nobreak


cd C:\Program Files\Internet Explorer
iexplore http://www.google.pt/search?q=%browserq%
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'SAK.SBB', 'Your search is now done.', [System.Windows.Forms.ToolTipIcon]::Information)}"
goto browser

:homesaklic
set /p passfile=<C:\SAK\bin\accountinfo\pass.txt
set /p userfile=<C:\SAK\bin\accountinfo\user.txt
set /p datefile=<C:\SAK\bin\accountinfo\datecreated.txt
set /p ipfile=<C:\SAK\bin\accountinfo\ip.txt
title SAK Account Manager // @pfpz
cls
color 0a
cls
if exist C:\SAK\bin\accountinfo\user.txt (echo Current user is %userfile%) else echo There is currently no accounts created on this device
echo Create an account now if this is your first time or make a new account! (E)xit \ (S)AK
echo -------------------------------------------------------------------------------------------
set /p choice=Do you want to (C)reate a new account, (D)elete an account, or see account (I)nfo?: 
if %choice%==c goto accountcreate
if %choice%==d goto accountdelete
if %choice%==e exit
if %choice%==i goto accinfo
( if %choice%==s if exist C:\SAK\bin\accountinfo\user.txt goto menu 
    if not exist C:\SAK\bin\accountinfo\user.txt goto accountcreate )

:accountcreate
title if u see this hi lol
if not exist C:\SAK\bin\accountinfo mkdir C:\SAK\bin\accountinfo
if not exist C:\SAK\bin\logs mkdir C:\SAK\bin\logs
if exist C:\SAK\bin\accountinfo\user.txt goto createfail
if not exist C:\SAK\bin\accountinfo\user.txt goto accountcreate1

:createfail
cls
color 0c
title Account Creation Failed: // @pfpz
echo Your account creation has failed, refer to the popup message on your screen for information.
echo Contact @pfpz if your issue persists
start C:\SAK\bin\ace.vbs
goto homesaklic

:accountcreate1
cls
color 0a
title SAK Account Creator // @pfpz
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
if not exist C:\SAK\bin\accountinfo\user.txt goto errordel
cls
color 0c
title Account Deleter // @pfpz
echo Delete your account below!
set /p delete=Are you sure you want to delete your account? (Y or N): 
if %delete%==y goto deleted
if %delete%==n goto homesaklic

:deleted
cls
if exist C:\SAK\bin\accountinfo\user.txt goto delaccnow
if not exist C:\SAK\bin\accountinfo\user.txt goto errordel

:delaccnow
cls
del C:\SAK\bin\accountinfo\user.txt
del C:\SAK\bin\accountinfo\pass.txt
del C:\SAK\bin\accountinfo\datecreated.txt
del C:\SAK\bin\accountinfo\ip.txt
goto sucdel

:errordel
cls
color c0
title ERROR WHILE DELETING ACCOUNT: // @pfpz
start C:\SAK\bin\delerror.vbs
echo There was an issue with your deletion, please try again..
goto accountcreate

:sucdel
cls
color 0c
title Account Deleted Succesfully: // @pfpz
echo Deletion successful, return home now..
pause
goto homesaklic


:done
cls
color a0
title SAK Account Created Succesfully: // @pfpz
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Your account was successfully created. Press Yes to continue to SAK, No to go back to the account manager menu or Cancel to revert this process', 'SAK Account Created!: ', 'YesNoCancel', [System.Windows.Forms.MessageBoxIcon]::Information);}" > %TEMP%\out78.tmp
set /p buttonpress=<%TEMP%\out78.tmp
if %buttonpress%==Yes goto home
if %buttonpress%==No goto homesaklic
if %buttonpress%==Cancel (del C:\SAK\bin\accountinfo\user.txt
del C:\SAK\bin\accountinfo\pass.txt
del C:\SAK\bin\accountinfo\datecreated.txt
del C:\SAK\bin\accountinfo\ip.txt
goto accountcreate) 
goto homesaklic

:accinfo
cls
color 0c
title SAK Account Info // @pfpz
if exist C:\SAK\bin\accountinfo\pass.txt (
echo Account info is displayed below
echo Username: %userfile%
echo Password: %passfile%
echo Date created: %datefile%
echo IP Associated to account: %ipfile%
pause
goto homesaklic) else echo There is currently no account created on this device, create
echo an account now and try again
timeout /t 5
goto homesaklic
