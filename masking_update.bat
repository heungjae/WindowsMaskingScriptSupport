echo off
REM  The path to SQLCMD varies according to version, it might not be 110

if "%ACT_MULTI_OPNAME%" == "scrub-mount" if "%ACT_MULTI_END%" == "true" if "%ACT_PHASE%" == "post" ( GOTO maskcommand )
if "%1" == "test" ( GOTO maskcommand )
exit /B 0

:maskcommand
"C:\Program Files\Microsoft SQL Server\110\Tools\Binn\sqlcmd.exe" -b -i "C:\Program Files\Actifio\scripts\simplesqlmask.sql"
IF %ERRORLEVEL% EQU 0 (GOTO cleanexit)
exit /B 1

:cleanexit
exit /B 0

