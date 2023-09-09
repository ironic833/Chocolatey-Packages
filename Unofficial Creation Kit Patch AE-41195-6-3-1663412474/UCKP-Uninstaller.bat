@echo off
title UCKP - Uninstaller

@echo off
color 03

CD 
del CreationKit.ini 
del CreationKit.exe
del CreationKitPrefs.ini 

cls

CD
Xcopy /D /I /S /Y CK_Backup\*
CD


cls


@echo off

CD
del UCKP-Readme.txt
del UCKP-EULA.txt
del UCKP-Backup.bat
del UCKP-Uninstaller.bat

exit