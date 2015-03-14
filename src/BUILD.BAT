@echo off

REM -------------------------------------------------------------
REM SET THE C SHARP COMPILER LOCATION USING BACKSLASHES AND QUOTES
SET CSC=C:\WINDOWS\Microsoft.NET\Framework\v3.5\csc.exe

REM -----------------------------------------------------------------------------------
REM DO NOT EDIT BELOW HERE


echo CREATE THE HEXIFY APPLICATION
%CSC% /out:010_HEXIFY\ashex.exe 010_HEXIFY\ashex.cs 

echo.
ECHO BUILD THE SIMMETRICS DLL
ECHO.
ECHO CONVERT SIMMETRICS DLL TO HEX FILE FOR LOADING INTO SQLSERVER
010_HEXIFY\ashex.exe < 020_BUILD_SIMMETRICS\SimMetrics.dll  > 020_BUILD_SIMMETRICS\SimMetrics_1.5.dll.HEX

ECHO.
ECHO BUILD THE TEXT FUNCTIONS WRAPPER DLL
ECHO This is the SQL Server Assembly DLL that wrap around the Simmetrics DLL
%CSC% /r:030_BUILD_SIMILARITY\SimMetrics.dll /target:library /out:030_BUILD_SIMILARITY\SIMILARITY_001.dll 030_BUILD_SIMILARITY\SIMILARITY\Similarity.cs

ECHO.
ECHO CONVERT THE TEXT FUNCTIONS DLL TO HEX
ECHO This is a hack to allow easy loading of the DLL when
ECHO you don't have access to the SQL Server server
010_HEXIFY\ashex.exe < 030_BUILD_SIMILARITY\SIMILARITY_001.dll  > 030_BUILD_SIMILARITY\SIMILARITY_001.dll.HEX

ECHO.
ECHO OUTPUT DLL FILE AS HEX TO 030_BUILD_SIMILARITY\SIMILARITY_001.dll.HEX

ECHO.
ECHO Now edit your SQL Server load scripts

pause