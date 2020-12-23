@echo off

title "Example: HelloWorld"

set EXITCODE=0

if /i "%1"=="" goto usage
if /i "%1"=="clean" goto RunClean
if /i "%1"=="task" goto RunTask
if /i "%1"=="derive" goto RunDerive
if /i "%1"=="attr" goto RunAttr
if /i "%1"=="debug" goto RunDebug
goto fail

:RunClean
rmdir /S /Q classes
del /Q MyTask.jar
goto success

:RunTask
rem run ant's task
ant use
goto success

:RunDerive
rem run deriving from ant's task
ant derive
goto success

:RunAttr
rem run attributes of ant's task
ant attr
goto success

:RunDebug
rem debugging ant
ant -verbose -debug
goto success

:usage
set EXITCODE=1
echo 
echo build.bat [ARGS]
echo.
echo Example:
echo   build.bat clean
echo   build.bat task
echo   build.bat derive
echo   build.bat attr
echo   build.bat debug
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
