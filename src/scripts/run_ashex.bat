@echo off
echo.
echo.
echo -----------------------------------------------------------------
echo %~nx0
echo Convert DLL file to Hex file
echo.

IF [%1] == [] GOTO NO_DLL_FILE_SPECIFIED
IF [%2] == [] GOTO NO_HEX_FILE_SPECIFIED

echo DLL File: %1
echo Hex file: %2
%~dp0\..\ashex.exe < %1 > %2



REM Normal end to script
:END
Exit /B 0


:NO_DLL_FILE_SPECIFIED
echo ERROR 1: No environment specified
Exit /B 1

:NO_HEX_FILE_SPECIFIED
echo ERROR 2: No SQL Server Management Studio specified
Exit /B 2