@echo off
setlocal enabledelayedexpansion


set "PROJECT_DIR=%~dp0"
set "BIN_DIR=%PROJECT_DIR%bin"
set "SRC_DIR=%PROJECT_DIR%src"
set "UNSIGNED_DIR=%PROJECT_DIR%Unsigned"
set "SIGNED_DIR=%PROJECT_DIR%Signed"
set "CABARC_PATH=%BIN_DIR%\cabarc.exe"
set "SIGNTOOL_PATH=%BIN_DIR%\signtool.exe"
set "INF_NAME_FOUND=0"



REM --- Check if the src directory exists ---
if not exist "%SRC_DIR%\" (
    echo Error: The src directory does not exist.
    goto :sign_cabs
)

REM --- Check if the src directory is empty ---
for %%A in ("%SRC_DIR%\*.*") do (
    goto :inf_search
)
echo Warning: Skipping cab creation and moving to signing
goto :sign_cabs


:inf_search
REM --- Find the .inf file to name the cab file ---
echo Searching for .inf file in src directory...
for %%f in ("%SRC_DIR%\*.inf") do (
    set "INF_NAME=%%~nf"
    set "CAB_NAME=!INF_NAME!.cab"
    set "INF_NAME_FOUND=1"
    goto :inf_found
)


REM --- If no .inf file is found, use a default name ---
:inf_not_found
if !INF_NAME_FOUND! equ 0 (
    echo Warning: No .inf file found in src directory. Using default cab name "No_INF.cab"
    set "CAB_NAME=No_INF.cab"
)

:inf_found
set "CAB_FILE=%UNSIGNED_DIR%\%CAB_NAME%"


REM --- Make the CAB file ---
if not exist "%CABARC_PATH%" (
    echo Error: cabarc.exe not found. Please ensure the file exists in the %BIN_DIR% directory.
    goto :sign_cabs
)

if not exist "%UNSIGNED_DIR%\" (
    echo The Unsigned directory does not exist, creating it now...
    mkdir "%UNSIGNED_DIR%"
)

echo Packaging files from the src directory into %CAB_FILE%

REM --- Use PUSHD to change directory to the parent directory of src ---
pushd "%PROJECT_DIR%"

REM --- Execute the cabarc.exe command to include the src folder and its contents ---
"%CABARC_PATH%" -r -p n "%CAB_FILE%" src\*

popd

if %errorlevel% neq 0 (
    echo Error: cabarc.exe execution failed.
    echo Error code: %errorlevel%
    goto :end
) else (
    echo Files were successfully packaged into %CAB_FILE%
)

echo.
echo.

:sign_cabs
REM --- Sign and move the CAB files ---
echo Signing cab files in Unsigned directory...
if not exist "%SIGNTOOL_PATH%" (
    echo Error: signtool.exe not found. Please ensure the file exists in the %BIN_DIR% directory.
    goto :end
)

if not exist "%SIGNED_DIR%\" (
    echo The Signed directory does not exist, creating it now...
    mkdir "%SIGNED_DIR%"
)

for %%i in ("%UNSIGNED_DIR%\*.cab") do (
    set "UNSIGNED_CAB_PATH=%%i"
    set "UNSIGNED_CAB_NAME=%%~ni"
    
    REM Check if the cab file has already been signed by the script
    echo !UNSIGNED_CAB_NAME! | findstr /i "(Signed)" >nul
    if not !errorlevel! equ 0 (
        set "SIGNED_CAB_NAME=!UNSIGNED_CAB_NAME!(Signed).cab"
        set "SIGNED_CAB_PATH=!SIGNED_DIR!\!SIGNED_CAB_NAME!"
        echo.
        echo Processing file: !UNSIGNED_CAB_PATH!
        
        REM Create a temporary working copy
        copy "!UNSIGNED_CAB_PATH!" "!SIGNED_CAB_PATH!" >nul
        
        if exist "!SIGNED_CAB_PATH!" (
            "%SIGNTOOL_PATH%" sign /a /fd sha256 /n "Inventec Corporation" /t http://timestamp.comodoca.com/authenticode "!SIGNED_CAB_PATH!"

            REM http://timestamp.comodoca.com/authenticode
    	    REM http://timestamp.globalsign.com/scripts/timstamp.dll
    	    REM http://timestamp.comodoca.com/authenticode
    	    REM http://www.startssl.com/timestamp 
    	    REM http://timestamp.digicert.com

            if !errorlevel! neq 0 (
                echo Error code: !errorlevel!
                echo Signing failed. Please check your certificate and try again

                REM Delete the failed signed copy
                if exist "!SIGNED_CAB_PATH!" del "!SIGNED_CAB_PATH!"
                echo.
                echo Script execution stopped due to signing error
                goto :end
            ) 
        ) else (
            echo Error: Failed to create a copy for signing.
        )
    ) else (
        echo !UNSIGNED_CAB_PATH! appears to be a signed file. Skipping.
    )
)

echo.
echo.
echo All cab files have been processed.

:end
echo.
echo.
pause