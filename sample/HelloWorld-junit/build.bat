@echo off

title "Example: HelloWorld-log4j"

set EXITCODE=0

if /i "%1"=="" goto usage
if /i "%1"=="clean" goto GoClean
if /i "%1"=="ant" goto GoAnt
if /i "%1"=="junit" goto GoJunit
goto fail

:GoClean
rmdir /S /Q build
goto success

:GoAnt
rem compile, package and run the application via ant
ant main
goto success

:GoJunit
rem test the application via junit
ant junit
goto success

:usage
set EXITCODE=1
echo 
echo build.bat [ARGS]
echo.
echo Example:
echo   build.bat clean
echo   build.bat ant
echo   build.bat junit
goto fail

:success
set EXITCODE=0
echo Success!
goto cleanup

:fail
set EXITCODE=1
echo Failed!
goto cleanup

:cleanup
endlocal & exit /b %EXITCODE%
