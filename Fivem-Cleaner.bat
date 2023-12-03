@echo off
setlocal

echo.
echo FiveM Cleaner by xouse
echo Files and folders that will be deleted:
echo.

set "userFolder=%USERPROFILE%"
set "foldersToDelete="
set "filesToDelete="

set "foldersToDelete=%userFolder%\AppData\Local\FiveM\FiveM.app\data\cache;%foldersToDelete%"
set "filesToDelete=%userFolder%\AppData\Local\FiveM\FiveM.app\CitizenFX.ini;%filesToDelete%"
set "filesToDelete=%userFolder%\AppData\Local\FiveM\FiveM.app\asi-five.dll;%filesToDelete%"
set "foldersToDelete=%userFolder%\AppData\Roaming\CitizenFX;%foldersToDelete%"
set "foldersToDelete=%userFolder%\AppData\Local\DigitalEntitlements;%foldersToDelete%"

for %%i in (%foldersToDelete%) do (
    if exist "%%i" (
        echo Folder: %%i
    )
)

for %%j in (%filesToDelete%) do (
    if exist "%%j" (
        echo File: %%j
    )
)

echo.
echo Do you want to proceed with the deletion? (Y/N)
set /p "choice="

if /i "%choice%"=="Y" (
    for %%i in (%foldersToDelete%) do (
        if exist "%%i" (
            echo Deleting folder: %%i
            rmdir /s /q "%%i"
            echo Folder deleted successfully.
        )
    )

    for %%j in (%filesToDelete%) do (
        if exist "%%j" (
            echo Deleting file: %%j
            del "%%j"
            echo File deleted successfully.
        )
    )
) else (
    echo Operation cancelled.
)

pause
