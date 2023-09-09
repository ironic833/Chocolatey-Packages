@echo off

CD
mkdir CK_Backup

xcopy CreationKit.exe CK_Backup
xcopy CreationKit.ini CK_Backup
xcopy CreationKitPrefs.ini CK_Backup
xcopy CreationKitCustom.ini CK_Backup

Exit