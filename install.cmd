@echo off
REM Check for exactly one argument
IF "%~1"=="" (
    echo Usage: %~nx0 ^<path-to-place-you-want-to-install-bld-to^>
    exit /b 1
)

REM Create the target builder directory
mkdir "%~1\builder"

REM Copy contents of builder directory
xcopy builder "%~1\builder" /E /Y /I

REM Copy bld and bld.cmd to the target directory
copy /Y bld "%~1\"
copy /Y bld.cmd "%~1\"

