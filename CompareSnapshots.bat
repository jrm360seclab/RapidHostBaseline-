
@echo off
setlocal
set "old=%1"
set "new=%2"
if "%old%"=="" goto usage
if "%new%"=="" goto usage
echo Comparing snapshots:
echo Old: %old%
echo New: %new%
echo.
for %%f in (systeminfo.txt processes.txt netstat.txt installed_programs.txt) do (
    echo --- Comparing %%f ---
    fc "%old%\%%f" "%new%\%%f"
    echo.
)
pause
goto :eof
:usage
echo Usage: CompareSnapshots.bat "OldFolder" "NewFolder"
pause
