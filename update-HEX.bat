@echo off
setlocal enabledelayedexpansion

:: Generate random bytes and convert them to a lowercase hex string using PowerShell
for /f "delims=" %%i in ('powershell -command "[byte[]]$bytes = 1..58 | ForEach-Object { Get-Random -Minimum 0 -Maximum 256 }; [BitConverter]::ToString($bytes).ToLower() -replace '-', ''"') do set "hexString=%%i"

:: Form the full command
set "fullCommand=start """" goodbyedpi.exe -9 -e1 -q --fake-gen 29 --fake-from-hex %hexString% --blacklist ..\russia-blacklist.txt --blacklist ..\russia-youtube.txt"

:: Output the command to the console (for verification)
echo %fullCommand%

:: Copy the command to the clipboard using PowerShell
powershell -command "$fullCommand = '%fullCommand%'; Set-Clipboard -Value $fullCommand"

echo The command has been copied to the clipboard.

pause