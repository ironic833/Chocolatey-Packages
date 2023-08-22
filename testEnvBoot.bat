@echo off
title TestEnvBoot

:: Check if the script is already running with admin privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :runscript
)

:: Request admin privileges
echo Requesting admin privileges...
powershell -Command "Start-Process '%0' -Verb RunAs" & exit /b

:runscript
cd /d D:\Github\chocolatey-test-environment

vagrant up

timeout /t 60 /nobreak

echo "A snapshot has been taken."

vagrant snapshot save good

echo "Snapshot successful"

pause

choice /M "Do you want to shut down the Vagrant environment (Y/N)?"
if %errorlevel% equ 1 (
    vagrant down
    echo "Vagrant environment shut down."
) else (
    echo "Exiting without shutting down the Vagrant environment."
)

pause



