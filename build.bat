@echo off
setlocal enabledelayedexpansion

if defined VCPKG_ROOT (
    set VCPKG_PATH=%VCPKG_ROOT%
) else (
    set VCPKG_PATH=C:\Tools\vcpkg
)

set PORTS_PATH=%~dp0ports

"%VCPKG_PATH%\vcpkg.exe" install vcpkg-cmake vcpkg-cmake-config --recurse

rmdir /s /q "%VCPKG_PATH%\packages\lightlib_x64-windows" 2>nul
rmdir /s /q "%VCPKG_PATH%\buildtrees\lightlib" 2>nul

"%VCPKG_PATH%\vcpkg.exe" remove lightlib:x64-windows --purge

"%VCPKG_PATH%\vcpkg.exe" install --overlay-ports="%PORTS_PATH%" lightlib --recurse --editable