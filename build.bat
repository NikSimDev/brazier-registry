@echo off
setlocal enabledelayedexpansion

if defined VCPKG_ROOT (
    set VCPKG_PATH=%VCPKG_ROOT%
) else (
    set VCPKG_PATH=C:\Tools\vcpkg
)

set PORTS_PATH=%~dp0ports

"%VCPKG_PATH%\vcpkg.exe" install vcpkg-cmake vcpkg-cmake-config --recurse

rmdir /s /q "%VCPKG_PATH%\packages\brazier_x64-windows" 2>nul
rmdir /s /q "%VCPKG_PATH%\buildtrees\brazier" 2>nul

"%VCPKG_PATH%\vcpkg.exe" remove brazier:x64-windows --purge

"%VCPKG_PATH%\vcpkg.exe" install --overlay-ports="%PORTS_PATH%" brazier --recurse --editable