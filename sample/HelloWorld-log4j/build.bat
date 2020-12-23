@echo off

title "Example: HelloWorld-log4j"

set EXITCODE=0

if /i "%1"=="" goto usage
if /i "%1"=="clean" goto GoClean
if /i "%1"=="class" goto GoClass
if /i "%1"=="jar" goto GoJar
if /i "%1"=="ant" goto GoAnt
goto fail

:GoClean
rmdir /S /Q build
goto success

:GoClass
rem compile *.java and run *.class
md build\classes
copy /Y src\log4j.properties build\classes
javac -sourcepath src -d build\classes src\oata\HelloWorld.java -classpath "lib/log4j-1.2.17.jar"
java -cp build\classes;lib\* oata.HelloWorld
goto success

:GoJar
rem package *.class to startable *.jar and run *.jar
md build\jar
jar cfm build\jar\HelloWorld.jar myManifest -C build\classes .
java -jar build\jar\HelloWorld.jar
goto success

:GoAnt
rem compile, package and run the application via ant
ant main
goto success

:usage
set EXITCODE=1
echo 
echo build.bat [ARGS]
echo.
echo Example:
echo   build.bat clean
echo   build.bat class
echo   build.bat jar
echo   build.bat ant
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
