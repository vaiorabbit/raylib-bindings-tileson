::
:: For Windows + RubyInstaller2 with DevKit(MSYS2 gcc & make) + CMake users.
:: - Use this script after "ridk enable"d. See https://github.com/oneclick/rubyinstaller2/wiki/The-ridk-tool for details.
::
:: Usage
:: > ridk enable
:: > build_raylib_windows.bat  <- %PROGRAMFILES%\CMake\bin\cmake.exe will be used.
:: > build_raylib_windows.bat "D:\Program Files\CMake\bin\cmake.exe" <- You can give full path to 'cmake.exe'.

@echo off
setlocal enabledelayedexpansion
set CMAKE_EXE=%1
if %CMAKE_EXE% == "" (
    set CMAKE_EXE="%PROGRAMFILES%\CMake\bin\cmake"
)

set RAYLIB_DLL_PATH=..\raylib-bindings\raylib_dll

copy fix_raylib_tileson.patch tileson
cd tileson
git apply .\fix_raylib_tileson.patch
cd ..

pushd %~dp0
if not exist build (
    mkdir build
)
cd build
%CMAKE_EXE% -G "MSYS Makefiles" -D CMAKE_BUILD_TYPE=Release -D BUILD_SHARED_LIBS=ON -D RAYLIB_DLL_PATH=%RAYLIB_DLL_PATH% -D CMAKE_C_COMPILER=gcc ../
make
copy tileson.dll ..\..\lib
popd
