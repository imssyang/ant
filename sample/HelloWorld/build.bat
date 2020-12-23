@echo off

title "Example: HelloWorld"

set EXITCODE=0

if /i "%1"=="" goto usage
if /i "%1"=="class" goto RunClass
if /i "%1"=="jar" goto RunJar
if /i "%1"=="ant" goto RunAnt
if /i "%1"=="ant-enhance" goto RunAntEnhance
goto fail

:RunClass
rem compile *.java and run *.class
md build\classes
javac -sourcepath src -d build\classes src\oata\HelloWorld.java
java -cp build\classes oata.HelloWorld
goto success

:RunJar
rem package *.class to startable *.jar and run *.jar
md build\jar
jar cfm build\jar\HelloWorld.jar myManifest -C build\classes .
java -jar build\jar\HelloWorld.jar
goto success

:RunAnt
rem compile, package and run the application via ant
ant compile jar run
goto success

:RunAntEnhance
rem compile, package and run the application via ant
ant main -f build-enhance.xml
goto success

:usage
set EXITCODE=1
echo 
echo build.bat [ARGS]
echo.
echo Example:
echo   build.bat class
echo   build.bat jar
echo   build.bat ant
echo   build.bat ant-enhance
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
