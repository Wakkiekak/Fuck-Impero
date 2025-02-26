@echo off
color 6
cls
echo --------- Impero Delete Tool ---------

set /p userChoice=Wil je mij supporten voor mijn werk? (klik Y of N): 
if /I "%userChoice%"=="Y" (
    echo Dankje, heel aardig van je.
    timeout /t 2 /nobreak
    start https://www.youtube.com/@wakkiekak
	start https://www.instagram.com/wakkiekak/
) else (
    echo Ok dan niet...
)

echo.

echo Kijken of Impero is geinstalleerd...
wmic product get name | findstr /I "Impero Client" >nul
if %errorlevel%==0 (
    echo Impero Client is geinstalleerd.
    echo.

    echo Closing Impero processes...
    taskkill /F /IM ImperoClient.exe
    taskkill /F /IM BackdropClient.exe

    timeout /t 2 /nobreak

    echo Uninstalling Impero Client and Backdrop Client...
    wmic product where "name='Impero Client'" call uninstall /nointeractive
    wmic product where "name='Backdrop Client'" call uninstall /nointeractive

    echo Removing leftover directories...
    rd /s /q "C:\Program Files\Impero Software\Backdrop Client"
    rd /s /q "C:\Program Files\BackdropClient"
    rd /s /q "C:\Program Files (x86)\Impero"
    rd /s /q "C:\Program Files (x86)\BackdropClient"

    echo Programs removed.
) else (
    echo Impero Client is niet geinstalleerd. 
)

pause
