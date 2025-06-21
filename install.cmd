@echo off
rem ╔═══════════════════════════════════════════════════════════════╗
rem ║ install-bld.cmd - copy the bld tool, but keep Tasks.java      ║
rem ╚═══════════════════════════════════════════════════════════════╝
setlocal EnableExtensions

rem ── 1.  Check that exactly one argument (destination dir) was given
if "%~2" neq "" (
    echo Usage: %~nx0 ^<path-to-install-dir^>
    exit /b 1
)

if "%~1"=="" (
    echo Usage: %~nx0 ^<path-to-install-dir^>
    exit /b 1
)

set "DEST=%~1"
set "SRC=%~dp0"              rem directory where this script lives
set "SRC_BUILDER=%SRC%builder"
set "DEST_BUILDER=%DEST%\builder"

rem ── 2.  Prepare destination
mkdir "%DEST_BUILDER%" 2>NUL

rem ── 3.  Remove *.jar in the source builder folder (matches Bash behaviour)
del "%DEST_BUILDER%\*.jar" 2>NUL

rem ── 4.  Copy everything EXCEPT Tasks.java, always overwriting
for %%F in ("%SRC_BUILDER%\*") do (
    if /I not "%%~nxF"=="Tasks.java" (
        copy /Y "%%~F" "%DEST_BUILDER%\" >NUL
    )
)

rem ── 5.  Copy Tasks.java only if it’s not already there
if not exist "%DEST_BUILDER%\Tasks.java" (
    copy /Y "%SRC_BUILDER%\Tasks.java" "%DEST_BUILDER%\" >NUL
) else (
    echo Keeping existing "%DEST_BUILDER%\Tasks.java"
)

del "%DEST_BUILDER%\*.class" 2>NUL

rem ── 6.  Copy the wrapper scripts
copy /Y "%SRC%bld"      "%DEST%" >NUL
copy /Y "%SRC%bld.cmd"  "%DEST%" >NUL

echo Installation complete -> %DEST%
endlocal
