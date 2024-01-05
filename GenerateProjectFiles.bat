@echo off

if not exist "%~dp0Engine/CMakeLists.txt" goto Error_BatchFileInWrongLocation
cmake -S "%~dp0Engine" -B "%~dp0Engine/Intermediate" -G "MinGW Makefiles" -DBUILD_SHARED_LIBS=ON
cmake --build "%~dp0Engine/Intermediate"
@REM make -C "%~dp0Engine/Intermediate" clean
mkdir "%~dp0Engine/Config"
echo CHIMERA_ROOT=%~dp0Engine> %~dp0Engine/Config/DefaultEngine.ini
echo CHIMERA_PLUGINS=%~dp0Engine/Plugins>> %~dp0Engine/Config/DefaultEngine.ini
exit /B %ERRORLEVEL%

:Error_BatchFileInWrongLocation
echo GenerateProjectFiles ERROR: The batch file does not appear to be located in the root Chimera directory.  This script must be run from within that directory.
pause
exit /B 1