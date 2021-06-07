@echo off
set OUT=out
set WIN10SDK_ROOT=C:\Program Files (x86)\Windows Kits\10
set WIN10SDK_VERSION=10.0.19041.0
set SRC=src\Main.cpp src\D3D12nBodyGravity.cpp src\DXSample.cpp src\stdafx.cpp src\Win32Application.cpp src\SimpleCamera.cpp
set TARGET=%OUT%\d3d12nbodygravity.exe
set CC=clang
set CXXFLAGS=-fuse-ld=lld -v -DWIN32 -D_WINDOWS -D_UNICODE -DUNICODE -D_DEBUG -DUSE_PIX -Wno-address-of-temporary -Isrc\packages\WinPixEventRuntime.1.0.161208001\Include\WinPixEventRuntime\
set WIN10LIB=%WIN10SDK_ROOT%\lib\%WIN10SDK_VERSION%\
set LDFLAGS=-l"%WIN10LIB%\ucrt\x64\libucrtd" -l"%WIN10LIB%\um\x64\User32" -l"%WIN10LIB%\um\x64\shell32" -l"%WIN10LIB%\um\x64\dxgi" -l"%WIN10LIB%\um\x64\d3d12" -l"%WIN10LIB%\um\x64\d3dcompiler" -l"%WIN10LIB%\um\x64\dxguid" -lsrc\packages\WinPixEventRuntime.1.0.161208001\bin\WinPixEventRuntime


del /q %OUT%
mkdir %OUT%
%CC% %SRC% %CXXFLAGS% %LDFLAGS% -o %TARGET%
copy src\packages\WinPixEventRuntime.1.0.161208001\bin\WinPixEventRuntime.dll %OUT%\
copy src\*.hlsl %OUT%\
