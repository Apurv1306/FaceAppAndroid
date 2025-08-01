@echo off

REM -----------------------------------------------------------------------------
REM Gradle startup script for Windows
REM -----------------------------------------------------------------------------

@if "%DEBUG%" == "" @echo off

setlocal

set DEFAULT_JVM_OPTS=

set DIRNAME=%~dp0
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

if not defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=%JAVA_HOME%\bin\java.exe
if exist "%JAVA_EXE%" goto init

echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
goto fail

:findJavaFromJavaHome
set JAVA_EXE=java.exe
for %%i in ("%JAVA_EXE%") do set JAVA_EXE=%%~$PATH:i
if not defined JAVA_EXE goto noJava

:init
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% -classpath "%APP_HOME%gradle\wrapper\gradle-wrapper.jar" org.gradle.wrapper.GradleWrapperMain %*

exit /b %ERRORLEVEL%

:noJava
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
goto fail

:fail
endlocal
echo.
echo To fix this, set the JAVA_HOME environment variable to the directory of your JDK.
echo For example:
echo   set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_151
exit /b 1
