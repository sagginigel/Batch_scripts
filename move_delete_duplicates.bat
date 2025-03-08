@echo off
setlocal enabledelayedexpansion

set "source=C:\Users\new_user\src"
set "destination=U:\Dest"

echo Moving files from %source% to %destination%...
echo.

:: Loop through all subdirectories in the source directory
for /d %%D in ("%source%\*") do (
    set "subdir=%%~nxD"
    set "target=%destination%\!subdir!"

    :: Create the target subdirectory if it doesn't exist
    if not exist "!target!" mkdir "!target!"

    echo Moving files from %%D to !target! ...
    
    :: Loop through each file in the source subdirectory
    for %%F in ("%%D\*.*") do (
        echo Moving: %%F
        move "%%F" "!target!\" >nul 2>&1
    )
)

echo.
echo All files have been moved successfully!
pause
